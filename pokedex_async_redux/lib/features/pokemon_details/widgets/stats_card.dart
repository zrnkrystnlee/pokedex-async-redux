import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/stats.dart';
import 'package:pokedex_asyn_redux/utils/colors.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';
import 'package:pokedex_asyn_redux/widgets/spacing.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({
    required this.stat,
    Key? key,
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
  const _StatItem({
    required this.stats,
    Key? key,
  }) : super(key: key);

  final Stats stats;

  @override
  Widget build(BuildContext context) {
    final statInfo = _getStatInfo(stats.stat.name);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 15.0,
              height: 15.0,
              child: Image.asset(
                statInfo[imageName]!,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10.0),
            SizedBox(
              width: 70.0,
              height: 15.0,
              child: Center(
                child: Text(
                  statInfo[title]!,
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

Map<String, String> _getStatInfo(String statName) {
  switch (statName) {
    case hpCase:
      return {imageName: heartImage, title: hpLabel};
    case attackCase:
      return {imageName: swordImage, title: attackLabel};
    case defenseCase:
      return {imageName: shieldImage, title: defenseLabel};
    case spAttackCase:
      return {imageName: spAttackImage, title: spAttackLabel};
    case spDefCase:
      return {imageName: spShieldImage, title: spDefenseLabel};
    case speedCase:
      return {imageName: speedImage, title: speedLabel};
    default:
      return {imageName: pokeballImage, title: unknownLabel};
  }
}
