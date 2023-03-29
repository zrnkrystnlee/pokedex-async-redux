import 'package:flutter/material.dart';

class PokemonSearchBar extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const PokemonSearchBar({required this.onSearch, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for Pokemon',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: onSearch,
      ),
    );
  }
}
