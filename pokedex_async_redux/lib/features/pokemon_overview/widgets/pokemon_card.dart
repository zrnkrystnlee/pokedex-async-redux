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
    return Card(
      margin: const EdgeInsets.all(commonSpaceSize),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius)),
      elevation: commonSpaceSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: pokemonNameContainerHeight,
            padding: const EdgeInsets.symmetric(vertical: textPaddingVertical),
            child: Text(
              pokemon.name.capitalizeName(),
              style: const TextStyle(
                fontSize: pokemonNameFontSize,
                fontWeight: textFontWeight,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //TODO: Will add necessary codes for getting Primary Type of the Pokemon later
          Container(
            height: typeContainerHeight,
            padding: const EdgeInsets.symmetric(horizontal: typePaddingHorizontal),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(typeContainerBorderRadius),
              color: typeColorContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  type,
                  style: TextStyle(
                    fontSize: typeTextFontSize,
                    fontWeight: textFontWeight,
                    color: lightColor,
                  ),
                ),
                Container(
                  height: typePrimaryBoxHeight,
                  width: typePrimaryBoxWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(typeBoxBorderRadius),
                    color: lightColor,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    typePrimary,
                    style: TextStyle(
                      fontSize: typePrimaryTextFontSize,
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
