import 'package:flutter/material.dart';
import 'package:my_musical/themes/color_theme.dart';
import 'package:my_musical/themes/font_theme.dart';

class DiaryDetailScreen extends StatelessWidget {
  final String appBarTitle;
  const DiaryDetailScreen({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: const TextStyle(
            fontFamily: 'Cafe24Ssurrond',
          ),
        ),
        foregroundColor: ColorTheme.invertedColor,
        backgroundColor: ColorTheme.appBarColor,
        actions: [
          TextButton(
            onPressed: () {},
            child: Container(
              width: 40,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorTheme.invertedColor,
              ),
              child: Text('등록',
                  style: TextStyle(color: ColorTheme.elementary1Color)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: 330,
                decoration: BoxDecoration(
                  color: ColorTheme.invertedColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'ff',
                  style: FontTheme.diaryDetailTitleStyle,
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                width: 330,
                decoration: BoxDecoration(
                  color: ColorTheme.invertedColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'ff',
                  style: FontTheme.diaryDetailTitleStyle,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: appBarTitle != '작성'
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiaryDetailScreen(
                      appBarTitle: '수정',
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
              backgroundColor: ColorTheme.tintColor,
              foregroundColor: ColorTheme.invertedColor,
              child: const Icon(
                Icons.edit,
                size: 40,
              ),
            )
          : null,
    );
  }
}
