import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainBgColor,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Staatliches',
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
