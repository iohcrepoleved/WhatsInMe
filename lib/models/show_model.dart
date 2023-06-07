class ShowModel {
  final String gubun, title, thumb;

  ShowModel.fromJson(Map<String, dynamic> json)
      : gubun = json['gubun'],
        title = json['title'],
        thumb = json['thumb'];
}
