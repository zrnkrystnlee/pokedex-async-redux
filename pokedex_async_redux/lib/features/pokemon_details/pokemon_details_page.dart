import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon_details.dart';
import 'package:pokedex_asyn_redux/features/pokemon_details/widgets/abilities_card.dart';
import 'package:pokedex_asyn_redux/features/pokemon_details/widgets/general_details_container.dart';
import 'package:pokedex_asyn_redux/features/pokemon_details/widgets/moves_card.dart';
import 'package:pokedex_asyn_redux/features/pokemon_details/widgets/stats_card.dart';
import 'package:pokedex_asyn_redux/utils/async.dart';
import 'package:pokedex_asyn_redux/utils/colors.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';
import 'package:pokedex_asyn_redux/utils/string_extensions.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemonDetails,
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemon;
  final Async<PokemonDetails> pokemonDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDetailsPage,
      body: pokemonDetails.when(
        (pokemonDetails) => Stack(
          children: [
            Positioned(
              top: 90.0,
              left: 135.0,
              child: Image.asset(
                clearPokeball,
                height: 250.0,
                width: 250.0,
                color: pokeballClearColor,
              ),
            ),
            Positioned(
              top: 70.0,
              left: 25.0,
              child: Text(
                pokemon.name.capitalize(),
                style: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 40.0,
              left: 150.0,
              child: Image.network(
                pokemon.url.toCustomUrl,
                height: 220.0,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              top: 270.0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      GeneralDetailsContainer(pokemonDetails: pokemonDetails),
                      AbilitiesContainer(ability: pokemonDetails.abilities),
                      StatsContainer(stat: pokemonDetails.stats),
                      MovesContainer(move: pokemonDetails.moves),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        loading: () => Container(
          color: mainBgColor,
          child: Center(
            child: Image.asset(
              pokeballLoading,
              height: 220,
              width: 220,
            ),
          ),
        ),
        error: (errorMessage) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage));
          return const Center(
            child: Text(noDetailsAvailableLabel),
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
