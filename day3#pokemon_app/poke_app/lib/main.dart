import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/app_navigator.dart';
import 'package:poke_app/bloc/nav_cubit.dart';
import 'package:poke_app/bloc/pokemon_bloc.dart';
import 'package:poke_app/bloc/pokemon_detail_cubit.dart';
import 'package:poke_app/reponsitory/repons_service.dart';
import 'package:poke_app/view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ReponService _service = ReponService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service.getPokemonPage(0);
  }

  @override
  Widget build(BuildContext context) {
    final pokemonDetailCubit = PokemonDetailCubit();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.purple, accentColor: Colors.redAccent),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0)),
          ),
          BlocProvider(
              create: (context) =>
                  NavCubit(pokemonDetailCubit: pokemonDetailCubit)),
          BlocProvider(create: (context) => pokemonDetailCubit),
        ],
        child: AppNavigator(),
      ),
    );
  }
}
