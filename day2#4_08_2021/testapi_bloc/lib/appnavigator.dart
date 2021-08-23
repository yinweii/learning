import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapi_bloc/cubit/nav_cubit.dart';
import 'package:testapi_bloc/models/post.dart';
import 'package:testapi_bloc/screen/detail_screen.dart';
import 'package:testapi_bloc/screen/home_screen.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post>(builder: (context, post) {
      return Navigator(
        pages: [
          MaterialPage(child: HomeScreen()),
          if (post != null)
            MaterialPage(
              child: DetailScreen(
                post: post,
              ),
            ),
        ],
        onPopPage: (route, result) {
          // goi lai ham de lam sach data
          BlocProvider.of<NavCubit>(context).backToPosts();
          return route.didPop(result);
        },
      );
    });
  }
}
