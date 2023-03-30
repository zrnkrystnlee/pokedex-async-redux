import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon.dart';
import 'package:pokedex_asyn_redux/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_asyn_redux/features/pokemon_overview/widgets/pokemon_card.dart';
import 'package:pokedex_asyn_redux/features/pokemon_overview/widgets/pokemon_search_bar.dart';
import 'package:pokedex_asyn_redux/utils/async.dart';
import 'package:pokedex_asyn_redux/utils/colors.dart';
import 'package:pokedex_asyn_redux/utils/number_constants.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';
import 'package:pokedex_asyn_redux/widgets/reusable_appbar.dart';
import 'package:pokedex_asyn_redux/widgets/spacing.dart';

class PokemonOverviewPage extends StatefulWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    required this.searchedPokemons,
    required this.filterPokemons,
    required this.clearSearchedPokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final VoidCallback clearSearchedPokemons;
  final Function(String) filterPokemons;

  @override
  State<PokemonOverviewPage> createState() => _PokemonOverviewPageState();
}

class _PokemonOverviewPageState extends State<PokemonOverviewPage> {
  late TextEditingController _searchController;
  late bool isSearching;
  Timer? _debounceTimer;
  late String _searchQuery = emptyString;

  @override
  void initState() {
    super.initState();
    isSearching = false;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    if (widget.searchedPokemons.isNotEmpty) {
      widget.clearSearchedPokemons();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: pokemonOverviewTitle),
      body: Column(
        children: [
          PokemonSearchBar(
            textController: _searchController,
            clearSearchBar: _clearSearchedPokemons,
            textChanged: (val) {
              setState(() {
                _searchQuery = val;
              });
              _duringPokemonSearch(val);
            },
          ),
          Expanded(
            child: widget.pokemons.when(
              (data) {
                final filteredPokemons =
                    data.where((pokemon) => pokemon.name.toLowerCase().contains(_searchQuery.toLowerCase()));
                if (filteredPokemons.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          errorSearchMessage,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          magikarpFloppingImage,
                          height: pokemonImageSize,
                          width: pokemonImageSize,
                        ),
                      ],
                    ),
                  );
                } else {
                  return GridView.builder(
                    itemCount: filteredPokemons.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (_, index) {
                      final pokemon = filteredPokemons.elementAt(index);
                      return PokemonCard(
                          pokemon: pokemon,
                          onTap: () => _navigateToPokemonDetailsPage(context: context, pokemon: pokemon));
                    },
                  );
                }
              },
              loading: () => Container(
                color: mainBgColor,
                child: Center(
                  child: Image.asset(
                    mewSpinningImage,
                    height: pokemonImageSize,
                    width: pokemonImageSize,
                  ),
                ),
              ),
              error: (errorMessage) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => _showErrorMessageSnackbar(context, errorMessage),
                );
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(noPokemonsAvailableLabel),
                      const VerticalSpace(height: 20),
                      Image.asset(
                        pokedexErrorImage,
                        height: pokemonImageSize,
                        width: pokemonImageSize,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showErrorMessageSnackbar(BuildContext context, String? errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage ?? emptyString)),
    );
  }

  void _navigateToPokemonDetailsPage({
    required BuildContext context,
    required Pokemon pokemon,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PokemonDetailsConnector(pokemon: pokemon)),
    );
  }

  void _clearSearchedPokemons() {
    widget.clearSearchedPokemons;
    setState(() {
      _searchController.text = emptyString;
      isSearching = false;
    });
  }

  void _duringPokemonSearch(String queryText) {
    print('_duringPokemonSearch queryText: $queryText');
    _debounceTimer = Timer(
      const Duration(milliseconds: 1000),
      () => setState(() {
        widget.filterPokemons(queryText);
        isSearching = true;
      }),
    );
  }
}
