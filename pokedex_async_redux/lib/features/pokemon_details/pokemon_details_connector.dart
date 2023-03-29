import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/features/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex_asyn_redux/features/pokemon_details/pokemon_details_vm.dart';
import 'package:pokedex_asyn_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_asyn_redux/state/app_state.dart';

class PokemonDetailsConnector extends StatelessWidget {
  final String pokemonName;
  final String pokemonImageUrl;

  const PokemonDetailsConnector(
      {Key? key, required this.pokemonName, required this.pokemonImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVm>(
      vm: () => PokemonDetailsVmFactory(),
      onInit: (store) => store.dispatchAsync(GetPokemonDetailsAction(pokemonName: pokemonName)),
      onDispose: (store) => store.dispatchSync(ClearPokemonDetailsAction()),
      builder: (context, vm) => PokemonDetailsPage(pokemonDetails: vm.pokemonDetails),
    );
  }
}
