import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/models/modelexport.dart';
import 'package:poke_app/models/pokemon_detail.dart';
import 'package:poke_app/reponsitory/repons_service.dart';

class PokemonDetailCubit extends Cubit<PokemonDetail> {
  final _pokemonService = ReponService();
  PokemonDetailCubit() : super(null);
  void getPokemonDetail(int pokemonId) async {
    //list response
    final response = await Future.wait([
      _pokemonService.getPokemonInfo(pokemonId),
      //succses =>
      _pokemonService.getspeciesInfo(pokemonId),
    ]);

    //cast
    final pokemonInfo = response[0] as PokemonInfo;
    final speciesInfo = response[1] as PokemonSpeciesInfo;
    emit(PokemonDetail(
      id: pokemonInfo.id,
      name: pokemonInfo.name,
      imageUrl: pokemonInfo.imageUrl,
      types: pokemonInfo.types,
      weight: pokemonInfo.weight,
      height: pokemonInfo.height,
      desc: speciesInfo.desc,
    ));
  }

  void cleanPokemonDetail() => emit(null);
}
