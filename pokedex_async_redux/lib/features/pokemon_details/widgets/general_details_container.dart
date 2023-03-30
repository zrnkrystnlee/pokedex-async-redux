import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon_details.dart';
import 'package:pokedex_asyn_redux/features/pokemon_details/widgets/general_details_item.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';
import 'package:pokedex_asyn_redux/widgets/spacing.dart';

class GeneralDetailsContainer extends StatelessWidget {
  const GeneralDetailsContainer({
    required this.pokemonDetails,
    Key? key,
  }) : super(key: key);

  final PokemonDetails pokemonDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DetailItem(
              label: heightLabel,
              value: '${pokemonDetails.height} $cmLabel',
            ),
            DetailItem(
              label: weightLabel,
              value: '${pokemonDetails.weight} $kgLabel',
            ),
            DetailItem(
              label: baseExpLabel,
              value: '${pokemonDetails.baseExperience}',
            ),
          ],
        ),
        const VerticalSpace(height: 10.0),
      ],
    );
  }
}
