class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});
  factory Post.formJson(Map<String, dynamic> json) => Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']);
}
