import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:testapi_bloc/models/post.dart';

class DetailScreen extends StatelessWidget {
  final Post post;

  DetailScreen({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
        child: Text(post.body),
      ),
    );
  }
}
