part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonLoadingState extends PokemonState {}

class PokemonLoadSuccesState extends PokemonState {
  final List<Pokemon> pokeminList;
  final bool canLoadNextPage;

  PokemonLoadSuccesState({this.pokeminList, this.canLoadNextPage});
}

class PokemonLoadFaildState extends PokemonState {
  final String error;

  PokemonLoadFaildState({this.error});
}
