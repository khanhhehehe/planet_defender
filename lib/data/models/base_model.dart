import 'dart:convert';

import 'package:common/log/logger.dart';
import 'package:common/utils/date_utils.dart';

abstract class BaseModel {
  static String dateToJson(value) {
    if (value is DateTime) {
      return formatDate(value);
    }
    return '$value';
  }

  static int? toIntNullable(value) {
    if (value == null) return null;
    if (value is num) return value.round();
    return int.parse('$value');
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
