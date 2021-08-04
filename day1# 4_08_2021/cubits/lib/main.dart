import 'package:cubits/cubit/counter_cubit.dart';
import 'package:cubits/screen/home_screen.dart';
import 'package:cubits/screen/second_screen.dart';
import 'package:cubits/screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: HomeScreen(
          title: 'Flutter Demo Home Page',
          color: Colors.blue,
        ),
      ),
    );
  }
}
