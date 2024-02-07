import 'package:flutter/material.dart';

@immutable
class RemoteLockColors extends ThemeExtension<RemoteLockColors> {
  const RemoteLockColors({
    required this.rtlockPurple,
    required this.darkerRtlockPurple,
    required this.cadetGray,
    required this.antiFlashWhite,
    required this.systemRed,
    required this.systemGreen,
    required this.systemYellow,
    required this.oxfordBlue,
    required this.white,
    required this.black,
    required this.rtlockBorderPurple,
    required this.platinium,
    required this.gray85,
  });

  final Color? rtlockPurple;
  final Color? darkerRtlockPurple;
  final Color? cadetGray;
  final Color? antiFlashWhite;
  final Color? systemRed;
  final Color? systemGreen;
  final Color? systemYellow;
  final Color? oxfordBlue;
  final Color? white;
  final Color? black;
  final Color? rtlockBorderPurple;
  final Color? platinium;
  final Color? gray85;

  @override
  RemoteLockColors copyWith({
    Color? rtlockPurple,
    Color? darkerrtlockPurple,
    Color? cadetGray,
    Color? antiFlashWhite,
    Color? systemRed,
    Color? systemGreen,
    Color? systemYellow,
    Color? oxfordBlue,
    Color? white,
    Color? black,
    Color? rtlockBorderPurple,
    Color? platinium,
    Color? gray85,
  }) {
    return RemoteLockColors(
      rtlockPurple: rtlockPurple ?? this.rtlockPurple,
      darkerRtlockPurple: darkerrtlockPurple ?? this.darkerRtlockPurple,
      cadetGray: cadetGray ?? this.cadetGray,
      antiFlashWhite: antiFlashWhite ?? this.antiFlashWhite,
      systemRed: systemRed ?? this.systemRed,
      systemGreen: systemGreen ?? this.systemGreen,
      systemYellow: systemYellow ?? this.systemYellow,
      oxfordBlue: oxfordBlue ?? this.oxfordBlue,
      white: white ?? this.white,
      black: black ?? this.black,
      rtlockBorderPurple: rtlockBorderPurple ?? this.rtlockBorderPurple,
      platinium: platinium ?? this.platinium,
      gray85: gray85 ?? this.gray85,
    );
  }

  @override
  RemoteLockColors lerp(RemoteLockColors? other, double t) {
    if (other is! RemoteLockColors) {
      return this;
    }
    return RemoteLockColors(
      rtlockPurple: Color.lerp(rtlockPurple, other.rtlockPurple, t),
      darkerRtlockPurple: Color.lerp(darkerRtlockPurple, other.darkerRtlockPurple, t),
      cadetGray: Color.lerp(cadetGray, other.cadetGray, t),
      antiFlashWhite: Color.lerp(antiFlashWhite, other.antiFlashWhite, t),
      systemRed: Color.lerp(systemRed, other.systemRed, t),
      systemGreen: Color.lerp(systemGreen, other.systemGreen, t),
      systemYellow: Color.lerp(systemYellow, other.systemYellow, t),
      oxfordBlue: Color.lerp(oxfordBlue, other.oxfordBlue, t),
      white: Color.lerp(white, other.white, t),
      black: Color.lerp(black, other.black, t),
      rtlockBorderPurple: Color.lerp(rtlockBorderPurple, other.rtlockBorderPurple, t),
      platinium: Color.lerp(platinium, other.platinium, t),
      gray85: Color.lerp(gray85, other.gray85, t),
    );
  }

// Optional
  @override
  String toString() => '''MyColors(
rtlockPurple : $rtlockPurple ,
darkerrtlockPurple : $darkerRtlockPurple ,
cadetGray : $cadetGray ,
antiFlashWhite : $antiFlashWhite ,
systemRed : $systemRed ,
systemGreen : $systemGreen ,
systemYellow : $systemYellow ,
oxfordBlue : $oxfordBlue ,
white : $white ,
black : $black ,
rtlockBorderPurple : $rtlockBorderPurple ,
  )
platinium: $platinium;
gray85: $gray85''';
}

const RemoteLockColors lightRemoteLockColors = RemoteLockColors(
  rtlockPurple: Color(0xFF695ED3),
  darkerRtlockPurple: Color(0xFF4437C8),
  cadetGray: Color(0xFF97A3B7),
  antiFlashWhite: Color(0xFFF5F6F8),
  systemRed: Color(0xFFFF3B30),
  systemGreen: Color(0xFF34C759),
  systemYellow: Color(0xFFFFCC00),
  oxfordBlue: Color(0xFF0E0B28),
  white: Color(0xFFFFFFFF),
  black: Color(0xFF000000),
  rtlockBorderPurple: Color(0xFF6B5EDB),
  platinium: Color(0xFFD8DCE4),
  gray85: Color.fromARGB(255, 170, 172, 170),
);
