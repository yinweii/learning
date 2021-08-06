// ignore: slash_for_doc_comments
/**
  // https://pokeapi.co/api/v2/pokemon?limit=100&offset=200
  "count": 1118,
  "next": "https://pokeapi.co/api/v2/pokemon?offset=300&limit=100",
  "previous": "https://pokeapi.co/api/v2/pokemon?offset=100&limit=100",
  "results": [
    {
      "name": "unown",
      "url": "https://pokeapi.co/api/v2/pokemon/201/"
    },
    ]
 */
class Pokemon {
  final int id;
  final String name;
  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  Pokemon({this.id, this.name});
  factory Pokemon.formJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);
    return Pokemon(id: id, name: name);
  }
}

class PokemonPageRepon {
  final List<Pokemon> listpokemon;
  final bool canLoadNextPage;

  PokemonPageRepon({this.listpokemon, this.canLoadNextPage});
  factory PokemonPageRepon.fromJosn(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final listpokemon = (json['results'] as List)
        .map((listJson) => Pokemon.formJson(listJson))
        .toList();
    return PokemonPageRepon(
        listpokemon: listpokemon, canLoadNextPage: canLoadNextPage);
  }
}
