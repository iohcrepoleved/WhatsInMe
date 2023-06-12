import 'package:flutter/material.dart';
import 'package:my_musical/themes/font_theme.dart';

class ShowDetailScreen extends StatelessWidget {
  final String gubun, title, thumb, overview;
  const ShowDetailScreen(
      {super.key,
      required this.gubun,
      required this.title,
      required this.thumb,
      required this.overview});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.darken),
                  image: NetworkImage(thumb),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "<$gubun>",
                          style: FontTheme.showTextStyle,
                        ),
                      ),
                      Text(
                        title,
                        style: FontTheme.showTitleTextStyle,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "시놉시스",
                          style: FontTheme.showHeadlineTextStyle,
                        ),
                      ),
                      SizedBox(
                        width: 280,
                        height: 400,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Text(
                                  overview,
                                  textAlign: TextAlign.justify,
                                  style: FontTheme.showTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
