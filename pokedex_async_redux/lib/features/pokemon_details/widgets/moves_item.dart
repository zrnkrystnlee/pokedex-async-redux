import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/moves.dart';
import 'package:pokedex_asyn_redux/utils/colors.dart';
import 'package:pokedex_asyn_redux/utils/number_constants.dart';

class MoveItem extends StatelessWidget {
  const MoveItem({
    required this.move,
    Key? key,
  }) : super(key: key);

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
