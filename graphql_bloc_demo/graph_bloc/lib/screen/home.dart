import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_bloc/bloc/jobs_bloc.dart';
import 'package:graph_bloc/screen/detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs"),
      ),
      body: BlocBuilder<JobsBloc, JobsState>(
        builder: (context, state) {
          if (state is JobsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is JobsLoadedState) {
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.listJob.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                            job: state.listJob[index],
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        state.listJob[index].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          "Location:${state.listJob[index].locationNames ?? 'N/A'}"),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
