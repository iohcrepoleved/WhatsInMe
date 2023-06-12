class MusicModel {
  final String title, artist, album, thumb, url;

  MusicModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        artist = json['artist'],
        album = json['album'],
        thumb = json['thumb'],
        url = json['url'];
}
