class PostModel {
  final int id;
  final String title;
  final String body;

  PostModel(this.id, this.title, this.body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      json['id'],
      json['title'],
      json['body'],
    );
  }
}
