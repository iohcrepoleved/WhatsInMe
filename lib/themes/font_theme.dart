import 'package:flutter/material.dart';
import 'package:my_musical/themes/color_theme.dart';

class FontTheme {
  static TextStyle titleTextStyle = TextStyle(
      fontSize: 22, color: ColorTheme.tintColor, fontFamily: 'Cafe24Ssurrond');
  static TextStyle showTitleTextStyle = TextStyle(
      fontSize: 45,
      color: ColorTheme.invertedColor,
      fontFamily: 'ChosunGu',
      fontWeight: FontWeight.bold);
  static TextStyle showHeadlineTextStyle = TextStyle(
      fontSize: 30,
      color: ColorTheme.invertedColor,
      fontFamily: 'ChosunGu',
      fontWeight: FontWeight.w600);
  static TextStyle showTextStyle = TextStyle(
      fontSize: 15,
      color: ColorTheme.invertedColor,
      fontFamily: 'ChosunGu',
      height: 1.2,
      wordSpacing: 2);
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
