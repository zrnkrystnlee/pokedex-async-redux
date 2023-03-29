import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/stats.dart';
import 'package:pokedex_asyn_redux/utils/color_constants.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';
import 'package:pokedex_asyn_redux/widgets/spacing.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({
    Key? key,
    required this.stat,
  }) : super(key: key);

  final List<Stats> stat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          statsLabel,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpace(height: 10.0),
        Column(
          children: stat.map((stats) => _StatItem(stats: stats)).toList(),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({Key? key, required this.stats}) : super(key: key);

  final Stats stats;

  @override
  Widget build(BuildContext context) {
    String imageName;
    String title;
    switch (stats.stat.name) {
      case 'hp':
        imageName = heartImage;
        title = hpLabel;
        break;
      case 'attack':
        imageName = swordImage;
        title = attackLabel;
        break;
      case 'defense':
        imageName = shieldImage;
        title = defenseLabel;
        break;
      case 'special-attack':
        imageName = spAttackImage;
        title = spAttackLabel;
        break;
      case 'special-defense':
        imageName = spShieldImage;
        title = spDefenseLabel;
        break;
      case 'speed':
        imageName = speedImage;
        title = speedLabel;
        break;
      default:
        imageName = pokeballImage;
        title = unknownLabel;
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 15.0,
              height: 15.0,
              child: Image.asset(
                imageName,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10.0),
            SizedBox(
              width: 70.0,
              height: 15.0,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 70.0,
              child: Text(
                stats.baseStat.toString(),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 150.0,
              child: LinearProgressIndicator(
                value: stats.baseStat / 100,
                backgroundColor: greyColor,
                valueColor: const AlwaysStoppedAnimation<Color>(bgDetailsPage),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
