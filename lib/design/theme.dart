import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remotelock/design/remotelock_colors.dart';
import 'package:remotelock/design/remotelock_typo.dart';



// THEMES
enum ThemeState { light, dark }

ThemeData getTheme(ThemeState state) {
  late RemoteLockColors toshoColors;
  late ThemeData theme;

  if (state == ThemeState.dark) {
    toshoColors = lightRemoteLockColors;
    theme = ThemeData.light();
  } else {
    toshoColors = lightRemoteLockColors;
    theme = ThemeData.light();
  }

  return theme.copyWith(
    primaryColor: toshoColors.toshoPurple,

    // TEXTFIELD
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: toshoColors.cadetGray!.withAlpha(26),
      focusColor: toshoColors.cadetGray!.withAlpha(26),
      disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: toshoColors.toshoBorderPurple!, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: toshoColors.toshoBorderPurple!, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: toshoColors.systemRed!, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: toshoColors.systemRed!, width: 1.5),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      floatingLabelAlignment: FloatingLabelAlignment.start,
    ),

    //LOADER
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: toshoColors.toshoPurple,
    ),

    // // CHECKBOX
    // checkboxTheme: CheckboxThemeData(
    //   shape: OutlinedBorder(
    //     side: BorderSide(color: toshoColors.toshoBorderPurple!, width: 1.5),
    //       borderRadius: BorderRadius.circular(4.0),
    //       borderSide: BorderSide(color: toshoColors.systemRed!, width: 1.5)),
    // ),

    // // ELEVATED BUTTON
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(

    //   )
    // ),

    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: RemoteLockTypography.familyIntegralCF,
        fontWeight: FontWeight.w700,
        fontSize: 34,
        color: toshoColors.oxfordBlue,
        height: 1.21,
        letterSpacing: 0.37,
      ),
      // displayMedium: ,
      // displaySmall: ,
      titleLarge: TextStyle(
        fontFamily: RemoteLockTypography.familyIntegralCF,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: toshoColors.oxfordBlue,
        height: 1.21,
        letterSpacing: 0.37,
      ),
      titleMedium: TextStyle(
        fontFamily: RemoteLockTypography.familyIntegralCF,
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: toshoColors.oxfordBlue,
        height: 1.27,
        letterSpacing: 0.35,
      ),
      titleSmall: TextStyle(
        fontFamily: RemoteLockTypography.familyIntegralCF,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: toshoColors.oxfordBlue,
        height: 1.25,
        letterSpacing: 0.38,
      ),

      //Headline
      headlineLarge: GoogleFonts.montserrat(
        // fontFamily: RemoteLockTypography.familyMontserrat,
        fontWeight: FontWeight.w400,
        fontSize: 17,
        color: toshoColors.oxfordBlue,
        height: 1.29,
        letterSpacing: -0.4,
      ),

      //Body
      headlineMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 17,
        color: toshoColors.oxfordBlue,
        height: 1.29,
        letterSpacing: -0.4,
      ),

      //Callout
      headlineSmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: toshoColors.oxfordBlue,
        height: 1.31,
        letterSpacing: -0.32,
      ),

      //Subheadline
      bodyLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: toshoColors.oxfordBlue,
        height: 1.33,
        letterSpacing: -0.24,
      ),

      //Footnote
      bodyMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: toshoColors.oxfordBlue,
        height: 1.38,
        letterSpacing: -0.08,
      ),

      //Caption1
      labelLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: toshoColors.oxfordBlue,
        height: 1.33,
      ),

      //Caption2
      labelMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 11,
        color: toshoColors.oxfordBlue,
        height: 1.18,
        letterSpacing: -0.066,
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      toshoColors,
    ],
  );
}

// final _theme = ThemeData.light().copyWith(
//   primaryColor: AppColorsFoundation.pink,

//   //APP BAR
//   appBarTheme: AppBarTheme(backgroundColor: lightColecColors.white),

//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: lightColecColors.dark,
//       selectedIconTheme: IconThemeData(size: 35, color: lightColecColors.pink),
//       unselectedIconTheme:
//           IconThemeData(size: 35, color: lightColecColors.white),
//       selectedItemColor: lightColecColors.pink,
//       unselectedItemColor: lightColecColors.white),
//   navigationBarTheme: NavigationBarThemeData(
//     backgroundColor: lightColecColors.dark,
//     indicatorColor: Colors.transparent,
//     iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
//         (Set<MaterialState> states) {
//       if (states.contains(MaterialState.selected)) {
//         return IconThemeData(size: 35, color: lightColecColors.pink);
//       }
//       return IconThemeData(size: 35, color: lightColecColors.white);
//     }),
//   ),
//   textSelectionTheme: TextSelectionThemeData(
//     selectionColor: lightColecColors.lightGrey,
//     cursorColor: lightColecColors.lightGrey,
//     selectionHandleColor: lightColecColors.lightGrey,
//   ),

//   // TEXTFIELD
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: lightColecColors.white!,
//     focusColor: lightColecColors.white!,
//     focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8.0),
//         borderSide:
//             BorderSide(color: lightColecColors.borderGrey!, width: 1.0)),
//     enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8.0),
//         borderSide:
//             BorderSide(color: lightColecColors.borderGrey!, width: 1.0)),
//     floatingLabelBehavior: FloatingLabelBehavior.never,
//     floatingLabelAlignment: FloatingLabelAlignment.start,
//   ),
//   tabBarTheme: TabBarTheme(
//       labelPadding: const EdgeInsets.all(8.0),
//       indicatorColor: lightColecColors.dark!,
//       indicatorSize: TabBarIndicatorSize.tab),
//   filledButtonTheme: FilledButtonThemeData(
//       style: ButtonStyle(
//     //     textStyle: MaterialStateProperty.resolveWith<TextStyle>((Set<MaterialState> states) {
//     //   if (states.contains(MaterialState.disabled)) {
//     //     return ;
//     //   }
//     //   return lightColecColors.pink!;
//     // }),,
//     foregroundColor:
//         MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
//       if (states.contains(MaterialState.disabled)) {
//         return AppColorsFoundation.white.withAlpha(100);
//       }
//       return lightColecColors.white!;
//     }),
//     backgroundColor:
//         MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
//       if (states.contains(MaterialState.disabled)) {
//         return AppColorsFoundation.subltePink;
//       }
//       if (states.contains(MaterialState.hovered)) {
//         return lightColecColors.lightPink!;
//       }
//       if (states.contains(MaterialState.pressed)) {
//         return lightColecColors.darkerPink!;
//       }
//       if (states.contains(MaterialState.focused)) {
//         return lightColecColors.pink!;
//       }
//       return lightColecColors.pink!;
//     }),
//   )),
//   outlinedButtonTheme: OutlinedButtonThemeData(
//       style: ButtonStyle(
//     shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
//         (Set<MaterialState> states) {
//       if (states.contains(MaterialState.focused)) {
//         return StadiumBorder(
//             side: BorderSide(color: lightColecColors.pink!, width: 1.0));
//       }
//       return const StadiumBorder(side: BorderSide(width: 0.5));
//     }),
//     foregroundColor:
//         MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
//       if (states.contains(MaterialState.disabled)) {
//         return AppColorsFoundation.white.withAlpha(100);
//       }
//       if (states.contains(MaterialState.hovered) ||
//           states.contains(MaterialState.pressed)) {
//         return lightColecColors.white!;
//       }
//       return lightColecColors.dark!;
//     }),
//     backgroundColor:
//         MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
//       if (states.contains(MaterialState.disabled)) {
//         return AppColorsFoundation.dark3;
//       }
//       if (states.contains(MaterialState.hovered)) {
//         return lightColecColors.lightGrey!;
//       }
//       if (states.contains(MaterialState.pressed)) {
//         return lightColecColors.dark!;
//       }
//       return lightColecColors.white!;
//     }),
//   )),
//   // textButtonTheme: TextButtonThemeData(),
//   switchTheme: SwitchThemeData(
//     trackColor:
//         MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
//       if (states.contains(MaterialState.disabled)) {
//         return AppColorsFoundation.lightGrey2;
//       }
//       return AppColorsFoundation.pink;
//     }),
//   ),
//   // cupertinoOverrideTheme: Cuper,
//   // primarySwatch: AppColorsFoundation.lightGrey,
//   textTheme: const TextTheme(
//     // displayLarge: TextStyle(
//     //   fontFamily: AppTypographyFoundation.familyHeadings,
//     //   fontWeight: FontWeight.w700,
//     //   fontSize: AppTypographyFoundation.fontSizeH1,
//     //   color: AppColorsFoundation.dark,
//     // ),
//     // displayMedium: TextStyle(
//     //   fontFamily: AppTypographyFoundation.familyHeadings,
//     //   fontWeight: FontWeight.w900,
//     //   fontSize: AppTypographyFoundation.fontSizeH2,
//     //   color: AppColorsFoundation.dark,
//     // ),
//     // Figma => Display
//     displaySmall: TextStyle(
//       fontFamily: AppTypographyFoundation.familyHeadings,
//       fontWeight: FontWeight.w300,
//       fontSize: AppTypographyFoundation.fontSizeDisplaySmall,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Header
//     headlineLarge: TextStyle(
//       fontFamily: AppTypographyFoundation.familyHeadings,
//       fontWeight: FontWeight.w300,
//       fontSize: AppTypographyFoundation.fontSizeHeadlineLarge,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => N/A
//     headlineMedium: TextStyle(
//       fontFamily: AppTypographyFoundation.familyHeadings,
//       fontWeight: FontWeight.w400,
//       fontSize: AppTypographyFoundation.fontSizeTitleLarge,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Title 1
//     headlineSmall: TextStyle(
//       fontFamily: AppTypographyFoundation.familyHeadings,
//       fontWeight: FontWeight.w700,
//       fontSize: AppTypographyFoundation.fontSizeTitleLarge,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Title 2
//     titleLarge: TextStyle(
//       fontFamily: AppTypographyFoundation.familyBody,
//       fontWeight: FontWeight.w700,
//       fontSize: AppTypographyFoundation.fontSizeTitleMedium,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Headline
//     titleMedium: TextStyle(
//       fontFamily: AppTypographyFoundation.familyBody,
//       fontWeight: FontWeight.w700,
//       fontSize: AppTypographyFoundation.fontSizeLabelLarge,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Body
//     // Size : 16
//     titleSmall: TextStyle(
//       fontFamily: AppTypographyFoundation.familyBody,
//       fontWeight: FontWeight.w400,
//       fontSize: AppTypographyFoundation.fontSizeLabelSmall,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Caption
//     // Size 14
//     labelLarge: TextStyle(
//       fontFamily: AppTypographyFoundation.familyBody,
//       fontWeight: FontWeight.w400,
//       fontSize: AppTypographyFoundation.fontSizeBodyLarge,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Extra Large label
//     // Size 18
//     labelMedium: TextStyle(
//       fontFamily: AppTypographyFoundation.familyLabel,
//       fontWeight: FontWeight.w600,
//       fontSize: AppTypographyFoundation.fontSizeLabelMedium,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Large label
//     labelSmall: TextStyle(
//       fontFamily: AppTypographyFoundation.familyLabel,
//       fontWeight: FontWeight.w600,
//       fontSize: AppTypographyFoundation.fontSizeLabelSmall,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Normal label
//     bodyLarge: TextStyle(
//       fontFamily: AppTypographyFoundation.familyLabel,
//       fontWeight: FontWeight.w600,
//       fontSize: AppTypographyFoundation.fontSizeBodyLarge,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Small label
//     bodyMedium: TextStyle(
//       fontFamily: AppTypographyFoundation.familyLabel,
//       fontWeight: FontWeight.w400,
//       fontSize: AppTypographyFoundation.fontSizeBodyMedium,
//       color: AppColorsFoundation.dark,
//     ),
//     // Figma => Extra small label
//     bodySmall: TextStyle(
//       fontFamily: AppTypographyFoundation.familyLabel,
//       fontWeight: FontWeight.w400,
//       fontSize: AppTypographyFoundation.fontSizeBodySmall,
//       color: AppColorsFoundation.dark,
//     ),
//   ),
//   extensions: const <ThemeExtension<dynamic>>[
//     lightColecColors,
//     colecSpacing,
//   ],
// );

// THEME PROVIDERS
final themeProvider = Provider((ref) {
  final isLight = ref.watch(toggleThemeProvider);
  return isLight ? getTheme(ThemeState.light) : getTheme(ThemeState.light);
});

final toggleThemeProvider = StateProvider<bool>((ref) {
  return true;
});
