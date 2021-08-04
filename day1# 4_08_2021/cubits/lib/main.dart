import 'package:cubits/cubit/counter_cubit.dart';
import 'package:cubits/router.dart';
import 'package:cubits/screen/home_screen.dart';
import 'package:cubits/screen/second_screen.dart';
import 'package:cubits/screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        // routes: {
        //   '/': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: HomeScreen(title: 'HomePage', color: Colors.redAccent),
        //       ),
        //   '/second': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: SecondScreen(
        //             title: 'Second screen', color: Colors.orangeAccent),
        //       ),
        //   '/third': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child:
        //             ThirdScreen(title: 'Third screen', color: Colors.greenAccent),
        //       )
        // },
        onGenerateRoute: _appRouter.onGenerateRoute,
        theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
