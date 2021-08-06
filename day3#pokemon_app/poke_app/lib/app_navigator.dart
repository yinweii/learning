import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/nav_cubit.dart';
import 'package:poke_app/view/deatil_screen.dart';
import 'package:poke_app/view/home_screen.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(builder: (context, pokemonId) {
      return Navigator(
        pages: [
          MaterialPage(child: HomeScreen()),
          if (pokemonId != null) MaterialPage(child: DetailScreen())
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).backToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}
