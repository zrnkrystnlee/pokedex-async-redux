import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/abilities.dart';
import 'package:pokedex_asyn_redux/utils/colors.dart';
import 'package:pokedex_asyn_redux/utils/number_constants.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';

class AbilitiesContainer extends StatelessWidget {
  const AbilitiesContainer({
    required this.ability,
    Key? key,
  }) : super(key: key);

  final List<Abilities> ability;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(generalBorderRadiusSize),
          topRight: Radius.circular(generalBorderRadiusSize),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 40.0,
            width: double.infinity,
            child: Center(
              child: Text(
                abilityLabel,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: ability
                  .map((abilities) => Chip(
                        backgroundColor: bgDetailsContainer,
                        label: Text(
                          abilities.abilities.name.capitalize(),
                          style: const TextStyle(color: lightColor),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
