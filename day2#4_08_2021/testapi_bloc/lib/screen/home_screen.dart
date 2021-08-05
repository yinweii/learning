import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:testapi_bloc/cubit/nav_cubit.dart';
import 'package:testapi_bloc/cubit/post_cubit.dart';
import 'package:testapi_bloc/cubit/post_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadingPostState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedPostState) {
            return RefreshIndicator(
              onRefresh: () async =>
                  BlocProvider.of<PostBloc>(context).add(RefeshPostEvent()),
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  String title = state.posts[index].title;
                  return Card(
                    child: ListTile(
                      title: Text(title[0].toUpperCase() + title.substring(1)),
                      onTap: () => BlocProvider.of<NavCubit>(context)
                          .showPostDetails(state.posts[index]),
                    ),
                  );
                },
              ),
            );
          } else if (state is FailedToLoadPostState) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  }
}
