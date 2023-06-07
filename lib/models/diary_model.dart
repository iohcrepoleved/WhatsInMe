class DiaryModel {
  final String title, content;
  final DateTime createdAt, updatedAt;
  DiaryModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        createdAt = DateTime.parse(json['createdAt'].toDate().toString()),
        updatedAt = DateTime.parse(json['updatedAt'].toDate().toString());
}
