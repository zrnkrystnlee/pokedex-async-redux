import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/moves.dart';
import 'package:pokedex_asyn_redux/features/pokemon_details/widgets/moves_item.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';

import 'package:pokedex_asyn_redux/widgets/spacing.dart';

class MovesContainer extends StatelessWidget {
  const MovesContainer({
    required this.move,
    Key? key,
  }) : super(key: key);

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
          child: ListView(
            children: [
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: move.map((move) => MoveItem(move: move)).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
