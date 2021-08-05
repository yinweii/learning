import 'dart:convert';

import 'package:http/http.dart' as http;
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
}
