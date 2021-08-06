import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/pokemon_detail_cubit.dart';

class NavCubit extends Cubit<int> {
  PokemonDetailCubit pokemonDetailCubit;
  NavCubit({this.pokemonDetailCubit}) : super(null);
  void showPokemonDetail(int pokemonId) {
    pokemonDetailCubit.getPokemonDetail(pokemonId);
    print('pokemonID: $pokemonId');
    emit(pokemonId);
  }

  void backToPokedex() => emit(null);
}
