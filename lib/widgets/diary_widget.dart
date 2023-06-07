import 'package:flutter/material.dart';
import 'package:my_musical/screens/diary_detail_screen.dart';
import 'package:my_musical/themes/color_theme.dart';
import 'package:my_musical/themes/font_theme.dart';

class DiaryWidget extends StatelessWidget {
  final String title, content;
  final DateTime createdAt, updatedAt;
  const DiaryWidget({
    super.key,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiaryDetailScreen(
              appBarTitle: title,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
            color: ColorTheme.invertedColor,
            border: Border.all(
              width: 2,
              color: ColorTheme.appBarColor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: FontTheme.diaryTitleStyle,
                ),
                Text(
                  content,
                  style: FontTheme.diaryTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
