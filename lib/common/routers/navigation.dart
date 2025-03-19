import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppNavigation {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  pushWithParams<T>(context, {required String page, required T args}) {
    GoRouter.of(context).push(page);
  }

  push(context,
      {required String page,
      String? params,
      Map<String, dynamic>? paramsQuery}) {
    if (params != null) {
      final urlParams = '$page/$params';
      if (paramsQuery != null) {
        final String urlParamsQuery =
            _navigationQueryParams(urlParams, paramsQuery);
        return GoRouter.of(context).push(urlParamsQuery);
      }

      return GoRouter.of(context).push(urlParams);
    }

    if (paramsQuery != null) {
      final String urlParamsQuery = _navigationQueryParams(page, paramsQuery);
      return GoRouter.of(context).push(urlParamsQuery);
    }

    return GoRouter.of(context).push(page);
  }

  String _navigationQueryParams(
      String baseUrl, Map<String, dynamic> paramsQuery) {
    final String queryString = Uri(
        queryParameters: paramsQuery
            .map((key, value) => MapEntry(key, value?.toString()))).query;
    return '$baseUrl?$queryString';
  }

  pushName(context, {required String name, Map<String, dynamic>? paramsQuery}) {
    if (paramsQuery != null) {
      return context.pushNamed(name, queryParameters: paramsQuery);
    }

    return context.pushNamed(name);
  }

  popUtil(context, page) {
    final router = GoRouter.of(context);
    final GoRouterDelegate delegate = router.routerDelegate;
    final routes = delegate.currentConfiguration.routes.reversed.toList();
    for (var i = 0; i < routes.length; i++) {
      final route = routes[i] as GoRoute;
      if (route.path == page) return;
      GoRouter.of(context).pop();
    }
  }

  isContainsPage(context, page) {
    final router = GoRouter.of(context);
    final GoRouterDelegate delegate = router.routerDelegate;
    final routes = delegate.currentConfiguration.routes.reversed
        .map((e) => e as GoRoute)
        .toList();
    return routes.map((e) => e.path).contains(page);
  }

  replace(context,
      {required String page,
      String? params,
      Map<String, dynamic>? paramsQuery}) {
    if (params != null) {
      final urlParams = '$page/$params';
      if (paramsQuery != null) {
        final String urlParamsQuery =
            _navigationQueryParams(urlParams, paramsQuery);
        return GoRouter.of(context).pushReplacement(urlParamsQuery);
      }

      return GoRouter.of(context).pushReplacement(urlParams);
    }

    if (paramsQuery != null) {
      final String urlParamsQuery = _navigationQueryParams(page, paramsQuery);
      return GoRouter.of(context).pushReplacement(urlParamsQuery);
    }
    return GoRouter.of(context).pushReplacement(page);
  }

  pop(context) {
    return GoRouter.of(context).pop();
  }
}
