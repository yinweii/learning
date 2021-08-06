import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/nav_cubit.dart';
import 'package:poke_app/bloc/pokemon_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// meo
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        if (state is PokemonLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PokemonLoadSuccesState) {
          return GridView.builder(
            itemCount: state.pokeminList.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              String name = state.pokeminList[index].name;
              return GestureDetector(
                onTap: () => BlocProvider.of<NavCubit>(context)
                    .showPokemonDetail(state.pokeminList[index].id),
                child: Card(
                  child: GridTile(
                    child: Column(
                      children: [
                        Image.network(state.pokeminList[index].imageUrl),
                        Text(name[0].toUpperCase() + name.substring(1)),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is PokemonLoadFaildState) {
          return Center(
            child: Text(state.error.toString()),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
