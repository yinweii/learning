part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class PokemonPageRequest extends PokemonEvent {
  final int page;

  PokemonPageRequest({this.page});
}
