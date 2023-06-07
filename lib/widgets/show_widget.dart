import 'package:flutter/material.dart';
import 'package:my_musical/screens/intro_screen.dart';

class ShowWidget extends StatelessWidget {
  final String title, thumb;
  const ShowWidget({
    super.key,
    required this.title,
    required this.thumb,
  });

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
      child: Column(
        children: [
          Container(
            width: 180,
            height: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              thumb,
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title)
        ],
      ),
    );
  }
}
