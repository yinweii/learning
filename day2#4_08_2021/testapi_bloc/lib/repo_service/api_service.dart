import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testapi_bloc/models/comment.dart';
import 'package:testapi_bloc/models/post.dart';

class ApiService {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  Future<List<Post>> getData() async {
    var res = await http.get(Uri.parse(_baseUrl + '/posts'));
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body) as List;
      //conver json to list
      final posts = json.map((postJson) => Post.formJson(postJson)).toList();
      return posts;
    } else {
      throw Exception('Load failed!');
    }
  }

  Future<List<CommentPost>> searchData(String idPost) async {
    var res = await http.get(Uri.parse(_baseUrl + '/comments?postId=$idPost'));
    if (res.statusCode == 200) {
      final jsonComment = jsonDecode(res.body) as List;
      //conver json to list
      final listComment =
          jsonComment.map((e) => CommentPost.fromJson(e)).toList();

      //return comments;
      return listComment;
    } else {
      throw Exception('Load failed!');
    }
  }
}
