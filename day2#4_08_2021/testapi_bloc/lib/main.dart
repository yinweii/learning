import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapi_bloc/appnavigator.dart';
import 'package:testapi_bloc/cubit/nav_cubit.dart';
import 'package:testapi_bloc/cubit/post_cubit.dart';
import 'package:testapi_bloc/cubit/post_event.dart';
import 'package:testapi_bloc/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PostBloc()..add(LoadedPostEvent()),
          ),
          BlocProvider(
            create: (context) => NavCubit(),
          )
        ],
        child: AppNavigator(),
      ),
    );
  }
}
