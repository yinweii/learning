import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poke_app/models/modelexport.dart';

import 'package:poke_app/reponsitory/repons_service.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(null);
  final _pokemonService = ReponService();

  @override
  Stream<PokemonState> mapEventToState(
    PokemonEvent event,
  ) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoadingState();
      try {
        final pokemonPageResponse =
            await _pokemonService.getPokemonPage(event.page);
        yield PokemonLoadSuccesState(
            pokeminList: pokemonPageResponse.listpokemon,
            canLoadNextPage: pokemonPageResponse.canLoadNextPage);
      } catch (e) {
        yield PokemonLoadFaildState(error: e.toString());
      }
    }
  }
}
