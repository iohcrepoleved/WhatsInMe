import 'package:flutter/material.dart';
import 'package:my_musical/screens/diary_screen.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DiaryScreen(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '최아람',
            style: TextStyle(
              fontFamily: 'Cafe24Ssurrond',
              fontSize: 28,
              color: Colors.pink.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
