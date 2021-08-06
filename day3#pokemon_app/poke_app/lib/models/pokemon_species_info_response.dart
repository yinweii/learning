class PokemonSpeciesInfo {
  //flavor_text_entries
  final String desc;

  PokemonSpeciesInfo({this.desc});
  factory PokemonSpeciesInfo.formJson(Map<String, dynamic> json) =>
      PokemonSpeciesInfo(desc: json['flavor_text_entries']['flavor_text']);
}
