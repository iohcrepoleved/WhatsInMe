import 'package:flutter/material.dart';
import 'package:my_musical/widgets/name_widget.dart';
import 'package:my_musical/widgets/profile_widget.dart';

import 'package:my_musical/screens/home_button.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
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
              title: 'Music',
              icon: Icons.music_note,
              isInverted: true,
            ),
            HomeButton(
              title: 'Restaurant',
              icon: Icons.food_bank,
              isInverted: false,
            ),
            HomeButton(
              title: 'Play & Musical',
              icon: Icons.local_play,
              isInverted: true,
            ),
          ],
        ),
      ),
    );
  }
}
