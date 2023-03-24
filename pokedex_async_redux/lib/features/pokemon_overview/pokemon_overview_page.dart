import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon.dart';
import 'package:pokedex_asyn_redux/features/pokemon_overview/widgets/pokemon_card.dart';
import 'package:pokedex_asyn_redux/utils/constants.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    Key? key,
  }) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pokemonOverviewTitle),
      ),
      body: GridView.builder(
        itemCount: pokemons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) {
          final pokemon = pokemons[index];
          return PokemonCard(pokemon: pokemon);
        },
      ),
    );
  }
}
