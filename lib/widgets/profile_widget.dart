import 'package:flutter/material.dart';
import 'package:my_musical/screens/intro_screen.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IntroScreen(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/images/mocha.jpeg',
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
