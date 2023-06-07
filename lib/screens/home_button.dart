import 'package:flutter/material.dart';
import 'package:my_musical/screens/music_screen.dart';
import 'package:my_musical/screens/restaurant_screen.dart';
import 'package:my_musical/screens/show_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isInverted;
  final String? url;

  const HomeButton({
    super.key,
    required this.title,
    required this.icon,
    required this.isInverted,
    this.url,
  });

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  onButtonTap() async {
    if (widget.url != null) {
      await launchUrl(Uri.parse(widget.url!));
    } else {
      switch (widget.title) {
        case 'Restaurant':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RestaurantScreen(),
            ),
          );
          break;
        case 'Music':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MusicScreen(),
            ),
          );
          break;
        case 'Play & Musical':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Show(),
            ),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          width: 280,
          decoration: BoxDecoration(
            color: widget.isInverted ? Colors.white : Colors.pink.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: widget.isInverted
                            ? Colors.pink.shade300
                            : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Cafe24SsurrondAir',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      widget.icon,
                      color: widget.isInverted
                          ? Colors.pink.shade300
                          : Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
