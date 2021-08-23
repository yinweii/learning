class CommentPost {
  int postId;
  int id;
  String name;
  String email;
  String body;

  CommentPost({this.postId, this.id, this.name, this.email, this.body});

  CommentPost.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}
