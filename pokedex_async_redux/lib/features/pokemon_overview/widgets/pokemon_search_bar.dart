import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/utils/colors.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';

class PokemonSearchBar extends StatelessWidget {
  const PokemonSearchBar({
    required this.textController,
    required this.clearSearchBar,
    required this.textChanged,
    super.key,
  });

  final TextEditingController textController;
  final VoidCallback clearSearchBar;
  final Function(String)? textChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: searchPokemonHintText,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: lightColor,
                ),
                onChanged: textChanged),
          ),
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: clearSearchBar,
          ),
        ],
      ),
    );
  }
}
