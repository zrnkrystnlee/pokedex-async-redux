import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon.dart';
import 'package:pokedex_asyn_redux/features/pokemon_overview/widgets/pokemon_card.dart';
import 'package:pokedex_asyn_redux/utils/async.dart';
import 'package:pokedex_asyn_redux/utils/color_constants.dart';
import 'package:pokedex_asyn_redux/utils/constants.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pokemonOverviewTitle),
      ),
      body: pokemons.when(
        (data) => GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, index) {
            final pokemon = data[index];
            return PokemonCard(pokemon: pokemon);
          },
        ),
        loading: () => Container(
          color: loadingScreen,
          child: Center(
            child: Image.asset(
              pikachuRunningImage,
              height: 210,
              width: 210,
            ),
          ),
        ),
        error: (errorMessage) => AlertDialog(
          title: Text(errorMessage!),
        ),
      ),
    );
  }
}
