import 'package:blogapp/blocs/postbloc/post_bloc.dart';
import 'package:blogapp/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoadedState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (ctx, index) => buildPost(state.posts[index]),
            );
          } else if (state is PostFaildState) {
            return Center(child: Text(state.err.toString()));
          }
          return Container();
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/add');
                },
                icon: Icon(Icons.add_a_photo),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPost(Post post) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  post.date,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
                Text(
                  post.time,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  post.imageUrl,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 10.0,
            ),
            Text(
              post.title,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
