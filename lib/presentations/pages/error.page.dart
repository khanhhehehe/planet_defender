import 'package:planet_defender/common/routers/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final errorPageRoute = GoRoute(
    path: Pages.error,
    builder: (context, GoRouterState state) => const ErrorPage());

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
