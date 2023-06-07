import 'package:flutter/material.dart';
import 'package:my_musical/themes/color_theme.dart';

class FontTheme {
  static TextStyle titleTextStyle = TextStyle(
      fontSize: 22, color: ColorTheme.tintColor, fontFamily: 'Cafe24Ssurrond');
  static TextStyle diaryTitleStyle = const TextStyle(
    fontSize: 30,
    fontFamily: '나눔손글씨 중학생',
    fontWeight: FontWeight.w600,
  );
  static TextStyle diaryTextStyle = const TextStyle(
    fontSize: 25,
    fontFamily: '나눔손글씨 중학생',
  );
  static TextStyle diaryDetailTitleStyle = const TextStyle(
    fontSize: 40,
    fontFamily: '나눔손글씨 중학생',
    fontWeight: FontWeight.w600,
  );
  static TextStyle diaryDetailTextStyle = const TextStyle(
    fontSize: 30,
    fontFamily: '나눔손글씨 중학생',
  );
}
