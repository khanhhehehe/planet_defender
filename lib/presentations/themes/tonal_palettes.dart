import 'package:flutter/material.dart';

class TonalPalettes {
  final TonalPalettesColors primary;
  final TonalPalettesColors secondary;
  final TonalPalettesColors tertiary;
  final TonalPalettesColors error;
  final TonalPalettesColors neutral;
  final TonalPalettesColors neutralVariant;
  final TonalPalettesColors success;
  const TonalPalettes(
      {required this.primary,
      required this.secondary,
      required this.tertiary,
      required this.error,
      required this.neutral,
      required this.neutralVariant,
      required this.success});
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

  const TonalPalettesColors(
      {required this.tp0,
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
      required this.tp100});
}
