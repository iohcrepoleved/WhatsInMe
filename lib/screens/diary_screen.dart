import 'package:flutter/material.dart';
import 'package:my_musical/models/diary_model.dart';
import 'package:my_musical/screens/diary_detail_screen.dart';
import 'package:my_musical/services/firestore_service.dart';
import 'package:my_musical/themes/color_theme.dart';
import 'package:my_musical/widgets/diary_widget.dart';

class DiaryScreen extends StatelessWidget {
  DiaryScreen({
    super.key,
  });
  Future<List<DiaryModel>> diaries = FirestoreService().getDiaryData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '일기',
          style: TextStyle(
            fontFamily: 'Cafe24Ssurrond',
          ),
        ),
        foregroundColor: ColorTheme.invertedColor,
        backgroundColor: ColorTheme.appBarColor,
      ),
      backgroundColor: ColorTheme.backgroundColor,
      body: FutureBuilder(
        future: diaries,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return makeGrid(snapshot);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DiaryDetailScreen(
                appBarTitle: '작성',
              ),
              fullscreenDialog: true,
            ),
          );
        },
        backgroundColor: ColorTheme.tintColor,
        foregroundColor: ColorTheme.invertedColor,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }

  GridView makeGrid(AsyncSnapshot<List<DiaryModel>> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        var diary = snapshot.data![index];
        return DiaryWidget(
            title: diary.title,
            content: diary.content,
            createdAt: diary.createdAt,
            updatedAt: diary.updatedAt);
      },
    );
  }
}
