import 'package:flutter/material.dart';

class TonalPalettes {
  final TonalPalettesColors primary;
  final TonalPalettesColors secondary;
  final TonalPalettesColors tertiary;
  final TonalPalettesColors error;
  final TonalPalettesColors neutral;
  final TonalPalettesColors neutralVariant;
  final TonalPalettesColors success;
  final TonalPalettesColors warning;
  final TonalPalettesColors shade;
  final TonalPalettesColorGradient shine;
  final TonalPalettesColorGradient venice;
  final TonalPalettesColorGradient blueLight;
  final TonalPalettesColorGradient navy;
  final TonalPalettesColorGradient orangeFun;
  final TonalPalettesColorGradient soda;
  final TonalPalettesColorGradient light;

  const TonalPalettes({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.error,
    required this.neutral,
    required this.neutralVariant,
    required this.success,
    required this.warning,
    required this.shade,
    required this.shine,
    required this.venice,
    required this.blueLight,
    required this.navy,
    required this.orangeFun,
    required this.soda,
    required this.light,
  });
}

class TonalPalettesColors {
  final Color tp0;
  final Color tp10;
  final Color tp20;
  final Color? tp23;
  final Color? tp25;
  final Color? tp28;
  final Color tp30;
  final Color? tp35;
  final Color tp40;
  final Color tp50;
  final Color tp60;
  final Color tp70;
  final Color tp80;
  final Color tp90;
  final Color tp95;
  final Color tp99;
  final Color tp100;
  final Color tp200;
  final Color tp300;
  final Color tp400;
  final Color tp500;
  final Color tp600;
  final Color tp700;
  final Color tp800;
  final Color tp900;

  const TonalPalettesColors({
    required this.tp0,
    required this.tp10,
    required this.tp20,
    this.tp23,
    this.tp25,
    this.tp28,
    required this.tp30,
    this.tp35,
    required this.tp40,
    required this.tp50,
    required this.tp60,
    required this.tp70,
    required this.tp80,
    required this.tp90,
    required this.tp95,
    required this.tp99,
    required this.tp100,
    required this.tp200,
    required this.tp300,
    required this.tp400,
    required this.tp500,
    required this.tp600,
    required this.tp700,
    required this.tp800,
    required this.tp900,
  });
}

class TonalPalettesColorGradient {
  final List<Color> colorGradient;

  TonalPalettesColorGradient({required this.colorGradient});
}
