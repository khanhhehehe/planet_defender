import 'dart:convert';

import 'package:common/log/logger.dart';
import 'package:data_cache_manager/data_cache_manager.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:planet_defender/common/configs/app_configs.dart';
import 'package:planet_defender/common/configs/locators.dart';
import 'package:planet_defender/common/constants/key_constance.dart';
import 'package:planet_defender/data/models/device_info_model.dart';
import 'package:planet_defender/data/models/response.dart';
import 'package:planet_defender/presentations/bloc/auth/auth_bloc.dart';

abstract class BaseService {
  static final CustomClient defaultClient = CustomClient();
  static GetErrorMessage? _getErrorMessage;

  static GetErrorMessage get getErrorMessage =>
      _getErrorMessage ?? (err) => '$err';

  static set getErrorMessage(GetErrorMessage value) => _getErrorMessage = value;

  late final CustomClient client;

  BaseService({CustomClient? client}) {
    this.client = client ?? defaultClient;
  }

  Map<String, String> getHeadersWithToken(String token,
      {Map<String, String> extraParams = const {}}) {
    return {'Authorization': 'Bearer $token', ...mobileChannel, ...extraParams};
  }
}

Map<String, String> _defaultHeaders = {
  'Content-Type': 'application/json',
};
const mobileChannel = {'x-channel': 'E'};
const jwtPrefixToken = 'Bearer ';
final tokenExpiredError = ResponseBase(
    errorMessages: [ErrorMessages(errorCode: KeyConst.tokenExpired)],
    statusCode: 401,
    result: null);

Future _validateToken(Map<String, String> headers) async {
  final authorization = headers['Authorization'];
  if (authorization == null) return;
  if (!authorization.startsWith(jwtPrefixToken)) return;
  final token = authorization.replaceFirst(jwtPrefixToken, '');
  try {
    if (JwtDecoder.isExpired(token)) {
      dI<AuthBloc>().add(const Logout());
      throw tokenExpiredError;
    }
  } catch (e) {
    dI<AuthBloc>().add(const Logout());

    throw tokenExpiredError;
  }
}

void setDefaultHeaders(String userAgent, DeviceInfoModel deviceInfo) {
  _defaultHeaders = {
    ..._defaultHeaders,
    'User-Agent': userAgent,
    'Device-Id': deviceInfo.deviceId,
    'Brand': deviceInfo.brand,
    'Model': deviceInfo.model,
  };
}

Future<Response> catchError(Future<Response> request, Uri url,
    {bool isCached = false, DataCacheManager? cacheManager}) async {
  final startTime = DateTime.now().millisecondsSinceEpoch;
  try {
    Response response;
    if (cacheManager != null && isCached) {
      response = await _cacheFetchData(
          cacheKey: url.toString(),
          service: request,
          cacheManager: cacheManager);
    } else {
      response = await request;
    }
    if (response.headers['content-type'] == 'application/json') {
      response.headers['content-type'] = 'application/json; charset=utf-8';
    }
    if (response.statusCode == 401) {
      dI<AuthBloc>().add(const Logout());
      throw 'unAuth';
    }

    if (response.statusCode < 400) return response;
    final responseDecoded = ResponseBase.fromJson(json.decode(response.body));
    final req = response.request;
    _trackingError(req, response, responseDecoded);
    throw responseDecoded;
  } finally {
    final endTime = DateTime.now().millisecondsSinceEpoch;
    final timing = endTime - startTime;
    if (timing > 3000) {
      logger.w('request ${url.toString()} timeOut $timing');
    }
  }
}

bool _isDataStale(CachedData data) {
  DateTime currentTime = DateTime.now();
  DateTime dataTime = data.updatedAt;
  Duration difference = currentTime.difference(dataTime);
  return difference.inMinutes > 10;
}

Future<Response> _cacheFetchData(
    {required String cacheKey,
    required Future<Response> service,
    required DataCacheManager cacheManager}) async {
  CachedData? cachedData = await cacheManager.get(cacheKey);

  if (cachedData != null && _isDataStale(cachedData)) {
    final cachedDataValue = cachedData.value as String;
    final response = Response(cachedDataValue, 200);
    return response;
  }

  Response newData = await service;
  if (newData.statusCode < 400) {
    final String body = newData.body;
    await cacheManager.add(cacheKey, body);
    return Response(newData.body, 200);
  }
  return newData;
}

_trackingError(
    BaseRequest? request, Response response, ResponseBase error) async {
  final req = response.request;
  logger.e(response.request?.headers.toString());
  if (response.statusCode == 401) return;
  logger.e(
      ' error: ${jsonEncode(error)}\n  statusCode: ${response.statusCode.toString()}\n method: ${req?.method}\n url: ${req?.url}\n headers: ${req?.headers} ');
}

@lazySingleton
class CustomClient {
  final Client client = Client();
  final _cacheManager = DefaultDataCacheManager.instance;
  Map<String, String> _addDefaultPropertiesToHeader(
      Map<String, String>? currentHeaders) {
    final headers = currentHeaders ?? {};
    return {
      ..._defaultHeaders,
      ...headers,
      if (AppConfig.getToken.isNotEmpty)
        'Authorization': '$jwtPrefixToken${AppConfig.getToken}'
    };
  }

  Uri getUrlWithParams(String url, Map<String, dynamic>? params) {
    final uri = Uri.parse(url);
    if (params == null || params.isEmpty) return uri;
    final params0 = <String, dynamic>{};
    params0.addAll(uri.queryParameters);
    params0.addAll(params.map((key, value) => MapEntry(key, value.toString())));
    if (uri.scheme == 'https') {
      return Uri.https(uri.authority, uri.path, params0);
    }
    final result = Uri.http(uri.authority, uri.path, params0);
    return result;
  }

  Future<Response> get(String url,
      {Map<String, String>? customHeaders,
      Map<String, dynamic>? params,
      bool isCached = false}) async {
    final headers = _addDefaultPropertiesToHeader(customHeaders);
    await _validateToken(headers);
    final urlWithParams = getUrlWithParams(url, params);
    return catchError(
        client.get(urlWithParams, headers: headers),
        cacheManager: _cacheManager,
        isCached: isCached,
        urlWithParams);
  }

  Future<Response> post(String url,
      {Map<String, String>? customHeaders,
      Map<String, String>? params,
      body,
      Encoding? encoding}) async {
    final headers = _addDefaultPropertiesToHeader(customHeaders);
    await _validateToken(headers);
    final urlWithParams = getUrlWithParams(url, params);
    return catchError(
        client.post(urlWithParams,
            headers: headers, body: body, encoding: encoding),
        urlWithParams);
  }

  Future<Response> patch(String url,
      {Map<String, String>? customHeaders,
      Map<String, String>? params,
      body,
      Encoding? encoding}) async {
    final headers = _addDefaultPropertiesToHeader(customHeaders);
    await _validateToken(headers);
    final urlWithParams = getUrlWithParams(url, params);
    return catchError(
        client.patch(urlWithParams,
            headers: headers, body: body, encoding: encoding),
        urlWithParams);
  }

  Future<Response> put(String url,
      {Map<String, String>? customHeaders,
      Map<String, String>? params,
      body,
      Encoding? encoding}) async {
    final headers = _addDefaultPropertiesToHeader(customHeaders);
    await _validateToken(headers);
    final urlWithParams = getUrlWithParams(url, params);
    return catchError(
        client.put(urlWithParams,
            headers: headers, body: body, encoding: encoding),
        urlWithParams);
  }

  Future<Response> delete(String url,
      {Map<String, String>? customHeaders,
      Map<String, String>? params,
      body,
      Encoding? encoding}) async {
    final headers = _addDefaultPropertiesToHeader(customHeaders);
    await _validateToken(headers);
    final urlWithParams = getUrlWithParams(url, params);
    return catchError(
        client.delete(urlWithParams, headers: headers), urlWithParams);
  }
}

typedef GetErrorMessage = String Function(Exception err);
