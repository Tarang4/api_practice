class CommentModal {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentModal({this.body, this.id, this.email, this.postId, this.name});

  CommentModal.fromJson(Map<String, dynamic> map) {
    postId = map["postId"];
    id = map["id"];
    name = map["name"];
    email = map["email"];
    body = map["body"];
  }

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
