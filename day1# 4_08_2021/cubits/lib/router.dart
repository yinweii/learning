import 'package:cubits/cubit/counter_cubit.dart';
import 'package:cubits/screen/home_screen.dart';
import 'package:cubits/screen/second_screen.dart';
import 'package:cubits/screen/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                HomeScreen(title: 'HomePage', color: Colors.redAccent));
        // ignore: dead_code
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => SecondScreen(
                title: 'Second screen', color: Colors.orangeAccent));
        // ignore: dead_code
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) =>
                ThirdScreen(title: 'Third screen', color: Colors.greenAccent));
        // ignore: dead_code
        break;

      default:
        return null;
    }
  }
}
