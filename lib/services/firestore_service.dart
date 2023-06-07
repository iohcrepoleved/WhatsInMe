import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_musical/models/diary_model.dart';
import 'package:my_musical/models/music_model.dart';
import 'package:my_musical/models/restaurant_model.dart';
import 'package:my_musical/models/show_model.dart';

class FirestoreService {
  final firestore = FirebaseFirestore.instance;

  Future<List<ShowModel>> getShowData(String gubun) async {
    List<ShowModel> showInstances = [];
    final response = await firestore
        .collection('show')
        .where("gubun", isEqualTo: gubun)
        .get();

    if (response.docs.isNotEmpty) {
      final List<dynamic> shows = response.docs;
      for (var show in shows) {
        showInstances.add(ShowModel.fromJson(show.data()));
      }
      return showInstances;
    }
    throw Error();
  }

  Future<List<MusicModel>> getMusicData() async {
    List<MusicModel> musicInstances = [];
    final response = await firestore.collection('music').orderBy("title").get();

    if (response.docs.isNotEmpty) {
      final List<dynamic> musics = response.docs;
      for (var music in musics) {
        musicInstances.add(MusicModel.fromJson(music.data()));
      }
      return musicInstances;
    }
    throw Error();
  }

  Future<List<RestaurantModel>> getRestaurantData() async {
    List<RestaurantModel> restaurantInstances = [];
    final response = await firestore.collection('restaurant').get();

    if (response.docs.isNotEmpty) {
      final List<dynamic> restaurants = response.docs;
      for (var restaurant in restaurants) {
        restaurantInstances.add(RestaurantModel.fromJson(restaurant.data()));
      }
      return restaurantInstances;
    }
    throw Error();
  }

  Future<List<DiaryModel>> getDiaryData() async {
    List<DiaryModel> diaryInstances = [];
    final response = await firestore.collection('diary').get();

    if (response.docs.isNotEmpty) {
      final List<dynamic> diaries = response.docs;
      for (var diary in diaries) {
        diaryInstances.add(DiaryModel.fromJson(diary.data()));
      }
      return diaryInstances;
    }
    throw Error();
  }
}
