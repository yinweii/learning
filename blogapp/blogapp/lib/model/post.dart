class Post {
  final String id;
  final String title;
  final String date;
  final String time;
  final String imageUrl;

  Post({this.id, this.title, this.date, this.time, this.imageUrl});
  factory Post.fomJson(Map<String, dynamic> json) => Post(
        id: '',
        time: json['time'],
        title: json['title'],
        date: json['date'],
        imageUrl: json['image'],
      );
}
