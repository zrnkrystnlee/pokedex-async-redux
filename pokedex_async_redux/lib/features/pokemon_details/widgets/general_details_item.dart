import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/utils/colors.dart';
import 'package:pokedex_asyn_redux/widgets/spacing.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);

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
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const VerticalSpace(height: 4.0),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
