import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon.dart';
import 'package:pokedex_asyn_redux/features/pokemon_overview/widgets/pokemon_card.dart';
import 'package:pokedex_asyn_redux/utils/async.dart';
import 'package:pokedex_asyn_redux/utils/color_constants.dart';
import 'package:pokedex_asyn_redux/utils/constants.dart';
import 'package:pokedex_asyn_redux/widgets/spacing.dart';

class PokemonOverviewPage extends StatelessWidget {
  PokemonOverviewPage({
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
            (data) {
          return GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (_, index) {
              final pokemon = data[index];
              return PokemonCard(pokemon: pokemon);
            },
          );
        },
        loading: () =>
            Container(
              color: loadingScreen,
              child: Center(
                child: Image.asset(
                  pikachuRunningImage,
                  height: 210,
                  width: 210,
                ),
              ),
            ),
        error: (errorMessage) {
          WidgetsBinding.instance.addPostFrameCallback(
                (_) => _showErrorMessageSnackbar(context, errorMessage),
          );
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(noPokemonsAvailableLabel),
                const VerticalSpace(height: 20),
                Image.asset(
                  pokedexErrorImage,
                  height: 120,
                  width: 120,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showErrorMessageSnackbar(BuildContext context, String? errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage ?? emptyString)),
    );
  }
}
