class PokemonInfo {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int weight;
  final int height;

  PokemonInfo(
      {this.id,
      this.name,
      this.imageUrl,
      this.types,
      this.weight,
      this.height});
  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List)
        .map((typeJson) => typeJson['type']['name'] as String)
        .toList();
    return PokemonInfo(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      types: types,
      weight: json['weight'],
      height: json['height'],
    );
  }
}
