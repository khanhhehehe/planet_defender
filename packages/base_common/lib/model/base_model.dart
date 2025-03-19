import 'dart:convert';

import 'package:common/log/logger.dart';
import 'package:common/utils/proto.dart';

abstract class BaseModel {
  final String id;

  BaseModel(this.id);
  static int? toIntNullable(value) {
    if (value == null) return null;
    if (value is num) return value.round();
    return int.tryParse('$value');
  }

  static DateTime? dateFromJson(String? value) {
    try {
      if (value == null) return null;
      final date = DateTime.parse(value);
      return DateTime(date.year, date.month, date.day);
    } catch (e) {
      logger.e(e);
      return DateTime.fromMicrosecondsSinceEpoch(0);
    }
  }

  static DateTime dateTimeFromJson(String? value) {
    if (value != null) {
      try {
        return DateTime.parse(value).toLocal();
      } catch (e) {
        logger.e(e);
      }
    }
    return DateTime.fromMicrosecondsSinceEpoch(0);
  }

  Map<String, dynamic> toJson();

  static int? intFromJsonNullable(value) {
    return ProtoUtils.toNullableInt(value);
  }

  static double? doubleFromJsonNullable(value) {
    return ProtoUtils.toNullableDouble(value);
  }

  static int intFromJson(value) {
    return ProtoUtils.toInt(value);
  }

  static double doubleFromJson(value) {
    return ProtoUtils.toDouble(value) ?? 0;
  }

  static bool boolFromJson(value) {
    return '$value' == 'true';
  }

  static String stringFromJson(value) {
    return '$value';
  }

  static String localDateToString(DateTime date) {
    return date.toIso8601String().substring(0, 10);
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
