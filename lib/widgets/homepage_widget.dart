import 'package:flutter/material.dart';
import 'package:my_musical/themes/color_theme.dart';
import 'package:my_musical/screens/home_button.dart';
import 'package:my_musical/widgets/name_widget.dart';
import 'package:my_musical/widgets/profile_widget.dart';

class HomepageWidget extends StatelessWidget {
  const HomepageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 70,
          horizontal: 20,
        ),
        child: Column(
          children: const [
            ProfileWidget(),
            SizedBox(
              height: 30,
            ),
            NameWidget(),
            SizedBox(
              height: 30,
            ),
            HomeButton(
              title: 'Github',
              icon: Icons.handyman,
              isInverted: true,
              url: "https://github.com/iohcrepoleved",
            ),
            HomeButton(
              title: 'Notion',
              icon: Icons.note_add,
              isInverted: false,
              url:
                  "https://iohcrepoleved.notion.site/iohcrepoleved/Welcome-8007eea3f47241c0bebddb194ba6e9aa",
            ),
            HomeButton(
              title: 'Daily Blog',
              icon: Icons.edit_note,
              isInverted: true,
              url: "https://blog.naver.com/mylastfantasy",
            ),
            HomeButton(
              title: 'Instagram',
              icon: Icons.photo,
              isInverted: false,
              url: "https://instagram.com/wejearam?igshid=NTc4MTIwNjQ2YQ==",
            ),
          ],
        ),
      ),
    );
  }
}
