import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon_details.dart';
import 'package:pokedex_asyn_redux/utils/color_constants.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';
import 'package:pokedex_asyn_redux/widgets/spacing.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({required this.label, required this.value, Key? key}) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: bgDetailsContainer,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalSpace(height: 4.0),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

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
            DetailContainer(
              label: heightLabel,
              value: '${pokemonDetails.height} $cmLabel',
            ),
            DetailContainer(
              label: weightLabel,
              value: '${pokemonDetails.weight} $kgLabel',
            ),
            DetailContainer(
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
