import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger(printer: PrefixPrinter(PrettyPrinter(colors: true)));

class Log {
  static final logger =
      Logger(printer: PrefixPrinter(PrettyPrinter(colors: false)));
  static final debug = logger.d;
  static final errors = logger.e;
  static final info = logger.i;
  static final warn = logger.w;
  static final log = logger.log;

  static error(dynamic error) {
    String message;
    try {
      message = json.encode(error);
    } catch (e) {
      message = error.toString();
    }
    return logger.e('Error $message', error, StackTrace.current);
  }
}

void printObject(Object object) {
  // Encode your object and then decode your object to Map variable
  final jsonMapped = json.decode(json.encode(object));
  // Using JsonEncoder for spacing
  const encoder = JsonEncoder.withIndent('  ');
  // encode it to string
  final prettyPrint = encoder.convert(jsonMapped);
  // print or debugPrint your object
  debugPrint(prettyPrint);
}
