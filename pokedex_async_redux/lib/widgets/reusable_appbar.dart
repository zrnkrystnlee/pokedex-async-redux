import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/utils/color_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({required this.title, Key? key}) : super(key: key);

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
