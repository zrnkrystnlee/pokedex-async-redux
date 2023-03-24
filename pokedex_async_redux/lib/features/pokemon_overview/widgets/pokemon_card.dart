import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon.dart';
import 'package:pokedex_asyn_redux/utils/constants.dart';
import 'package:pokedex_asyn_redux/utils/string_extensions.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonName = pokemon.name.capitalize();
    return Card(
      margin: const EdgeInsets.all(commonSpaceSize),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius),
      ),
      elevation: commonSpaceSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 40.0,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              pokemonName,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //TODO: Will add necessary codes for getting Primary Type of the Pokemon later
          Container(
            height: typeContainerHeight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: typeColorContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  type,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: lightColor,
                  ),
                ),
                Container(
                  height: typePrimaryBoxHeight,
                  width: typePrimaryBoxWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: lightColor,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    typePrimary,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: darkColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(commonSpaceSize),
              child: SizedBox(
                width: pokemonImageSize,
                height: pokemonImageSize,
                child: Image.network(
                  pokemon.url.toCustomUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
