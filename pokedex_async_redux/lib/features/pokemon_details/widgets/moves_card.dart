import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/moves.dart';
import 'package:pokedex_asyn_redux/utils/color_constants.dart';
import 'package:pokedex_asyn_redux/utils/number_constants.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';

import 'package:pokedex_asyn_redux/widgets/spacing.dart';

class MovesContainer extends StatelessWidget {
  const MovesContainer({Key? key, required this.move}) : super(key: key);

  final List<Moves> move;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          movesLabel,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const VerticalSpace(height: 8.0),
        SizedBox(
          height: 240.0,
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: move.map((move) => MoveItem(move: move)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class MoveItem extends StatelessWidget {
  const MoveItem({Key? key, required this.move}) : super(key: key);

  final Moves move;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(generalBorderRadiusSize),
          color: bgDetailsContainer,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              move.moves.name,
              style: const TextStyle(
                fontSize: 12.0,
                color: lightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
