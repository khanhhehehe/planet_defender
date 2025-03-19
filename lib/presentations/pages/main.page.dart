import 'package:planet_defender/common/routers/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final mainPageRoute = GoRoute(
    path: Pages.main,
    builder: (context, GoRouterState state) => const MainPage());

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
