import 'package:flutter/material.dart';
import 'package:my_musical/models/show_model.dart';
import 'package:my_musical/services/firestore_service.dart';
import 'package:my_musical/themes/color_theme.dart';
import 'package:my_musical/themes/font_theme.dart';
import 'package:my_musical/widgets/show_widget.dart';

class Show extends StatelessWidget {
  final Future<List<ShowModel>> musicals =
      FirestoreService().getShowData('뮤지컬');

  final Future<List<ShowModel>> plays = FirestoreService().getShowData('연극');
  Show({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('공연',
            style: TextStyle(
              fontFamily: 'Cafe24Ssurrond',
            )),
        foregroundColor: ColorTheme.invertedColor,
        backgroundColor: ColorTheme.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '연극',
                  style: FontTheme.titleTextStyle,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            FutureBuilder(
              future: plays,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: makeList(snapshot),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Row(
              children: [
                Text(
                  '뮤지컬',
                  style: FontTheme.titleTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            FutureBuilder(
              future: musicals,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: makeList(snapshot),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<ShowModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var show = snapshot.data![index];
        return ShowWidget(
          title: show.title,
          thumb: show.thumb,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
    );
  }
}
