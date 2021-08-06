import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:poke_app/models/pokemon_info_response.dart';
import 'package:poke_app/models/pokemon_reponse.dart';
import 'package:poke_app/models/pokemon_species_info_response.dart';

class ReponService {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageRepon> getPokemonPage(int indexPage) async {
    //pokemon?limit=200&offset=400
    final queryParam = {
      'limit': '200',
      'offset': (indexPage * 200).toString(),
    };
    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParam);
    final res = await client.get(uri);
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      return PokemonPageRepon.fromJosn(json);
    } else {
      return throw Exception('Failed to laod!');
    }
  }

// get pokemon info
  Future<PokemonInfo> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');
    try {
      final res = await client.get(uri);
      final json = jsonDecode(res.body);
      // print data
      print(json);
      return PokemonInfo.fromJson(json);
    } catch (e) {
      return throw Exception('Faild!');
    }
  }

// get pokemon-species info
  Future<PokemonSpeciesInfo> getspeciesInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');
    try {
      final res = await client.get(uri);
      final json = jsonDecode(res.body);
      return PokemonSpeciesInfo.formJson(json);
    } catch (e) {
      print('ERROR TO GET SPECIES:' + e.toString());
      return throw Exception('Faild!');
    }
  }
}
