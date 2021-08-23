import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapi_bloc/bloc/search_bloc.dart';

class SearchPost extends SearchDelegate {
  final SearchBloc searchBloc;
  // post id
  String queryString;

  SearchPost({this.searchBloc}) : super(searchFieldLabel: 'postId: 3');
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    searchBloc.add(Search(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SearchLoaded) {
          return ListView.builder(
            itemCount: state.listComment.length,
            itemBuilder: (context, index) {
              String name = state.listComment[index].name;
              return Card(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'NAME: ${name[0].toUpperCase() + name.substring(1)}'),
                      SizedBox(height: 10),
                      Text('EMAIL: ${state.listComment[index].email}'),
                      SizedBox(height: 10),
                      Text('Comment: ${state.listComment[index].body}'),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is SearchFailed) {
          return Center(
            child: Text(state.error),
          );
        }
        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Search...'),
      ),
    );
  }
}
