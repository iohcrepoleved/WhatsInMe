import 'package:flutter/material.dart';
import 'package:my_musical/themes/color_theme.dart';

class MusicWidget extends StatelessWidget {
  final String title, artist, thumb;
  const MusicWidget({
    super.key,
    required this.artist,
    required this.title,
    required this.thumb,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.network(
              thumb,
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                artist,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorTheme.elementary1Color,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
