import 'package:flutter/material.dart';
import 'package:my_musical/models/music_model.dart';
import 'package:my_musical/services/firestore_service.dart';
import 'package:my_musical/themes/color_theme.dart';
import 'package:my_musical/widgets/music_widget.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final Future<List<MusicModel>> musics = FirestoreService().getMusicData();
  TextEditingController searchTextEditingController = TextEditingController();

  controlSearching(str) {
    setState(() {
      searchPlaylist(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorTheme.backgroundColor,
        appBar: AppBar(
          title: const Text(
            '음악',
            style: TextStyle(
              fontFamily: 'Cafe24Ssurrond',
            ),
          ),
          foregroundColor: ColorTheme.invertedColor,
          backgroundColor: ColorTheme.appBarColor,
        ),
        body: Column(
          children: [
            searchBar(),
            searchPlaylist(context),
          ],
        ));
  }

  // 서치바
  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorTheme.invertedColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 40,
        child: TextFormField(
          controller: searchTextEditingController,
          style: const TextStyle(color: Colors.black),
          onFieldSubmitted: controlSearching,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search Here ...',
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              Icons.search,
              color: ColorTheme.elementary1Color,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.cancel),
              color: ColorTheme.elementary1Color,
              onPressed: initializedSearchBar,
            ),
          ),
        ),
      ),
    );
  }

  // 검색바 초기화
  initializedSearchBar() {
    setState(() {
      searchTextEditingController.clear();
      searchPlaylist(context);
    });
  }

  // 전체 플레이리스트
  searchPlaylist(BuildContext context) {
    return FutureBuilder(
      future: musics,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(child: makeList(snapshot));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  ListView makeList(AsyncSnapshot<List<MusicModel>> snapshot) {
    List<MusicModel> searchResults = [];
    for (var i in snapshot.data!) {
      if (i.title.contains(searchTextEditingController.text)) {
        searchResults.add(i);
      }
    }
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        var music = searchResults[index];
        return MusicWidget(
          artist: music.artist,
          title: music.title,
          thumb: music.thumb,
          url: music.url,
        );
      },
      separatorBuilder: (context, index) => const Divider(
        thickness: 0.5,
      ),
    );
  }
}
