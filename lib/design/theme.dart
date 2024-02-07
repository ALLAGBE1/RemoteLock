import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remotelock/design/remotelock_colors.dart';
import 'package:remotelock/design/remotelock_typo.dart';

// THEMES
enum ThemeState { light, dark }

ThemeData getTheme(ThemeState state) {
  late RemoteLockColors rtlockColors;
  late ThemeData theme;

  if (state == ThemeState.dark) {
    rtlockColors = lightRemoteLockColors;
    theme = ThemeData.light();
  } else {
    rtlockColors = lightRemoteLockColors;
    theme = ThemeData.light();
  }

  return theme.copyWith(
    primaryColor: rtlockColors.rtlockPurple,

    // TEXTFIELD
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: rtlockColors.cadetGray!.withAlpha(26),
      focusColor: rtlockColors.cadetGray!.withAlpha(26),
      disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: rtlockColors.rtlockBorderPurple!, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: rtlockColors.rtlockBorderPurple!, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: rtlockColors.systemRed!, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: rtlockColors.systemRed!, width: 1.5),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      floatingLabelAlignment: FloatingLabelAlignment.start,
    ),

    //LOADER
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: rtlockColors.rtlockPurple,
    ),

    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: RemoteLockTypography.familyIntegralCF,
        fontWeight: FontWeight.w700,
        fontSize: 34,
        color: rtlockColors.oxfordBlue,
        height: 1.21,
        letterSpacing: 0.37,
      ),
      // displayMedium: ,
      // displaySmall: ,
      titleLarge: TextStyle(
        fontFamily: RemoteLockTypography.familyIntegralCF,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: rtlockColors.oxfordBlue,
        height: 1.21,
        letterSpacing: 0.37,
      ),
      titleMedium: TextStyle(
        fontFamily: RemoteLockTypography.familyIntegralCF,
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: rtlockColors.oxfordBlue,
        height: 1.27,
        letterSpacing: 0.35,
      ),
      titleSmall: TextStyle(
        fontFamily: RemoteLockTypography.familyIntegralCF,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: rtlockColors.oxfordBlue,
        height: 1.25,
        letterSpacing: 0.38,
      ),

      //Headline
      headlineLarge: GoogleFonts.montserrat(
        // fontFamily: RemoteLockTypography.familyMontserrat,
        fontWeight: FontWeight.w400,
        fontSize: 17,
        color: rtlockColors.oxfordBlue,
        height: 1.29,
        letterSpacing: -0.4,
      ),

      //Body
      headlineMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 17,
        color: rtlockColors.oxfordBlue,
        height: 1.29,
        letterSpacing: -0.4,
      ),

      //Callout
      headlineSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: rtlockColors.oxfordBlue,
        height: 1.31,
        letterSpacing: -0.32,
      ),

      //Subheadline
      bodyLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: rtlockColors.oxfordBlue,
        height: 1.33,
        letterSpacing: -0.24,
      ),

      //Footnote
      bodyMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: rtlockColors.oxfordBlue,
        height: 1.38,
        letterSpacing: -0.08,
      ),

      //Caption1
      labelLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: rtlockColors.oxfordBlue,
        height: 1.33,
      ),

      //Caption2
      labelMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 11,
        color: rtlockColors.oxfordBlue,
        height: 1.18,
        letterSpacing: -0.066,
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      rtlockColors,
    ],
  );
}

// THEME PROVIDERS
final themeProvider = Provider((ref) {
  final isLight = ref.watch(toggleThemeProvider);
  return isLight ? getTheme(ThemeState.light) : getTheme(ThemeState.light);
});

final toggleThemeProvider = StateProvider<bool>((ref) {
  return true;
});
