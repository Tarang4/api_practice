class PostModal {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModal({this.body, this.id, this.title, this.userId});

  PostModal.fromJson(Map<String, dynamic> map) {
    userId = map["userId"];
    id = map["id"];
    title = map["title"];
    body = map["body"];
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
