class ShowModel {
  final String gubun, title, thumb, overview;

  ShowModel.fromJson(Map<String, dynamic> json)
      : gubun = json['gubun'],
        title = json['title'],
        thumb = json['thumb'],
        overview = json['overview'];
}
