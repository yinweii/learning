import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/pokemon_detail_cubit.dart';
import 'package:poke_app/models/pokemon_detail.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: BlocBuilder<PokemonDetailCubit, PokemonDetail>(
          builder: (context, detail) {
        return detail != null
            ? Center(
                child: Text(detail.name),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
