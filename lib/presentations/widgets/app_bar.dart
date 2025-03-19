import 'package:planet_defender/presentations/themes/themes.dart';
import 'package:flutter/material.dart';

AppBar baseAppBar(BuildContext context,
    {bool? canPop,
    Function()? actionWhenPop,
    List<Widget>? actions,
    String? title}) {
  final theme = Theme.of(context);
  final colors = AppTheme.getColors(context);
  final pageCanPop = canPop ?? Navigator.of(context).canPop();
  return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: colors.textLight),
      leading: pageCanPop
          ? InkWell(
              onTap: () {
                if (actionWhenPop != null) actionWhenPop();
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: colors.textLight,
              ))
          : null,
      actions: actions,
      title: Text(title ?? '', style: theme.textTheme.headlineMedium),
      backgroundColor: colors.background);
}
