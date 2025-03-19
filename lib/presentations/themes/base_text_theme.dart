import 'package:flutter/material.dart';

class AppTextStyle {
  static const fwLight = FontWeight.w200;
  static const fwSemiRegular = FontWeight.w300;
  static const fwRegular = FontWeight.w400;
  static const fwMedium = FontWeight.w500;
  static const fwSemiBold = FontWeight.w600;
  static const fwBold = FontWeight.w700;
}

class AppFonts {
  static const String agFsel = "AGFsel";
  static const String inter = "Inter";
}

class TypographyTheme {
  ///Inter Font
  static TextThemeStyle interDisplay = TextThemeStyle(
    ///Semi bold
    t11SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 11),
    t12SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 12),
    t14SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 14),
    t16SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 16),
    t22SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 22),
    t24SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 24),
    t28SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 28),
    t32SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 32),
    t36SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 36,
        height: 1.22),
    t45SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 45,
        height: 1.15),
    t57SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 57,
        height: 1.12),

    ///Regular
    t11R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 11),
    t12R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 12),
    t14R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 14),
    t16R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 16),
    t22R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 22),
    t24R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 24),
    t28R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 28),
    t32R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 32),
    t36R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 36,
        height: 1.22),
    t45R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 45,
        height: 1.15),
    t57R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 57,
        height: 1.12),
  );

  static TextThemeStyle interHeadline = TextThemeStyle(
    ///Semi bold
    t11SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 11),
    t12SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 12),
    t14SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 14),
    t16SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 16),
    t22SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 22),
    t24SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 24,
        height: 1.33),
    t28SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 28,
        height: 1.28),
    t32SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 32,
        height: 1.25),
    t36SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 36),
    t45SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 45),
    t57SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 57),

    ///Regular
    t11R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 11),
    t12R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 12),
    t14R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 14),
    t16R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 16),
    t22R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 22),
    t24R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 24,
        height: 1.33),
    t28R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 28,
        height: 1.28),
    t32R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 32,
        height: 1.25),
    t36R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 36),
    t45R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 45),
    t57R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 57),
  );

  static TextThemeStyle interTitle = TextThemeStyle(
    ///Semi bold
    t11SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 11),
    t12SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 12),
    t14SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.42),
    t16SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.5),
    t22SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 22,
        height: 1.27),
    t24SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 24),
    t28SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 28),
    t32SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 32),
    t36SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 36),
    t45SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 45),
    t57SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 57),

    ///Regular
    t11R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 11),
    t12R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 12),
    t14R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.42),
    t16R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5),
    t22R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 22,
        height: 1.27),
    t24R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 24),
    t28R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 28),
    t32R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 32),
    t36R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 36),
    t45R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 45),
    t57R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 57),
  );

  static TextThemeStyle interBody = TextThemeStyle(
    ///Semi bold
    t11SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 11),
    t12SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 1.33),
    t14SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.42),
    t16SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.5),
    t22SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 22),
    t24SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 24),
    t28SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 28),
    t32SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 32),
    t36SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 36),
    t45SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 45),
    t57SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 57),

    ///Regular
    t11R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 11),
    t12R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.33),
    t14R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.42),
    t16R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5),
    t22R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 22),
    t24R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 24),
    t28R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 28),
    t32R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 32),
    t36R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 36),
    t45R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 45),
    t57R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 57),
  );

  static TextThemeStyle interLabel = TextThemeStyle(
    ///Semi bold
    t11SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 11,
        height: 1.45),
    t12SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 1.33),
    t14SB: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.42),
    t16SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 16),
    t22SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 22),
    t24SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 24),
    t28SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 28),
    t32SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 32),
    t36SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 36),
    t45SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 45),
    t57SB: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w600, fontSize: 57),

    ///Regular
    t11R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 11,
        height: 1.45),
    t12R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.33),
    t14R: const TextStyle(
        fontFamily: AppFonts.inter,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.42),
    t16R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 16),
    t22R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 22),
    t24R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 24),
    t28R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 28),
    t32R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 32),
    t36R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 36),
    t45R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 45),
    t57R: const TextStyle(
        fontFamily: AppFonts.inter, fontWeight: FontWeight.w400, fontSize: 57),
  );

  ///AG Font
  static TextThemeStyle agDisplay = TextThemeStyle(
    ///Bold
    t11B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 11),
    t12B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 12),
    t14B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 14),
    t16B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 16),
    t22B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 22),
    t24B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 24),
    t28B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 28),
    t32B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 32),
    t36B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 36,
        height: 1.22),
    t45B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 45,
        height: 1.15),
    t57B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 57,
        height: 1.12),

    ///Regular
    t11R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 11),
    t12R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 12),
    t14R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 14),
    t16R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 16),
    t22R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 22),
    t24R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 24),
    t28R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 28),
    t32R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 32),
    t36R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 36,
        height: 1.22),
    t45R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 45,
        height: 1.15),
    t57R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 57,
        height: 1.12),
  );

  static TextThemeStyle agHeadline = TextThemeStyle(
    ///Bold
    t11B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 11),
    t12B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 12),
    t14B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 14),
    t16B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 16),
    t22B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 22),
    t24B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 1.33),
    t28B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        height: 1.28),
    t32B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 32,
        height: 1.25),
    t36B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 36),
    t45B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 45),
    t57B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 57),

    ///Regular
    t11R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 11),
    t12R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 12),
    t14R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 14),
    t16R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 16),
    t22R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 22),
    t24R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 24,
        height: 1.33),
    t28R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 28,
        height: 1.28),
    t32R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 32,
        height: 1.25),
    t36R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 36),
    t45R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 45),
    t57R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 57),
  );

  static TextThemeStyle agTitle = TextThemeStyle(
    ///Bold
    t11B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 11),
    t12B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 12),
    t14B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.42),
    t16B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1.5),
    t22B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 22,
        height: 1.27),
    t24B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 24),
    t28B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 28),
    t32B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 32),
    t36B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 36),
    t45B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 45),
    t57B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 57),

    ///Regular
    t11R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 11),
    t12R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 12),
    t14R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.42),
    t16R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5),
    t22R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 22,
        height: 1.27),
    t24R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 24),
    t28R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 28),
    t32R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 32),
    t36R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 36),
    t45R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 45),
    t57R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 57),
  );

  static TextThemeStyle agBody = TextThemeStyle(
    ///Bold
    t11B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 11),
    t12B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: 1.33),
    t14B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.42),
    t16B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1.5),
    t22B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 22),
    t24B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 24),
    t28B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 28),
    t32B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 32),
    t36B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 36),
    t45B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 45),
    t57B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 57),

    ///Regular
    t11R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 11),
    t12R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.33),
    t14R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.42),
    t16R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5),
    t22R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 22),
    t24R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 24),
    t28R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 28),
    t32R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 32),
    t36R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 36),
    t45R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 45),
    t57R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 57),
  );

  static TextThemeStyle agLabel = TextThemeStyle(
    ///Bold
    t11B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 11,
        height: 1.45),
    t12B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: 1.33),
    t14B: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.42),
    t16B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 16),
    t22B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 22),
    t24B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 24),
    t28B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 28),
    t32B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 32),
    t36B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 36),
    t45B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 45),
    t57B: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w700, fontSize: 57),

    ///Regular
    t11R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 11,
        height: 1.45),
    t12R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.33),
    t14R: const TextStyle(
        fontFamily: AppFonts.agFsel,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.42),
    t16R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 16),
    t22R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 22),
    t24R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 24),
    t28R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 28),
    t32R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 32),
    t36R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 36),
    t45R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 45),
    t57R: const TextStyle(
        fontFamily: AppFonts.agFsel, fontWeight: FontWeight.w400, fontSize: 57),
  );
}

class TextThemeStyle {
  final TextStyle? t11SB;
  final TextStyle? t12SB;
  final TextStyle? t14SB;
  final TextStyle? t16SB;
  final TextStyle? t22SB;
  final TextStyle? t24SB;
  final TextStyle? t28SB;
  final TextStyle? t32SB;
  final TextStyle? t36SB;
  final TextStyle? t45SB;
  final TextStyle? t57SB;

  final TextStyle? t11B;
  final TextStyle? t12B;
  final TextStyle? t14B;
  final TextStyle? t16B;
  final TextStyle? t22B;
  final TextStyle? t24B;
  final TextStyle? t28B;
  final TextStyle? t32B;
  final TextStyle? t36B;
  final TextStyle? t45B;
  final TextStyle? t57B;

  final TextStyle t11R;
  final TextStyle t12R;
  final TextStyle t14R;
  final TextStyle t16R;
  final TextStyle t22R;
  final TextStyle t24R;
  final TextStyle t28R;
  final TextStyle t32R;
  final TextStyle t36R;
  final TextStyle t45R;
  final TextStyle t57R;

  TextThemeStyle({
    this.t11SB,
    this.t12SB,
    this.t14SB,
    this.t16SB,
    this.t22SB,
    this.t24SB,
    this.t28SB,
    this.t32SB,
    this.t36SB,
    this.t45SB,
    this.t57SB,
    this.t11B,
    this.t12B,
    this.t14B,
    this.t16B,
    this.t22B,
    this.t24B,
    this.t28B,
    this.t32B,
    this.t36B,
    this.t45B,
    this.t57B,
    required this.t11R,
    required this.t12R,
    required this.t14R,
    required this.t16R,
    required this.t22R,
    required this.t24R,
    required this.t28R,
    required this.t32R,
    required this.t36R,
    required this.t45R,
    required this.t57R,
  });
}
