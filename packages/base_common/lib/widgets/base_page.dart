import 'package:flutter/material.dart';

typedef ArgsFromJson<S> = S Function(Map<String, dynamic> json);

abstract class BasePage<T> extends StatelessWidget {
  final ArgsFromJson<T>? argsFromJson;
  const BasePage({
    Key? key,
    this.argsFromJson,
  }) : super(key: key);

  T? getArgs(BuildContext context) {
    try {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is T) return args;
      if (argsFromJson == null) return null;

      if (args is Map<String, dynamic>) {
        return argsFromJson!(args);
      }
      return null;
    } catch (err) {
      return null;
    }
  }
}
