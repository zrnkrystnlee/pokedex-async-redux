import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedex_asyn_redux/api/api_service.dart';
import 'package:pokedex_asyn_redux/state/app_state.dart';
import 'package:pokedex_asyn_redux/utils/constants.dart';

/// Getting of Pokemons from Pokemon API
class GetPokemonsAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final pokemons = await ApiService().pokemonApi.getPokemonList(offset: offsetPokemon, limit: limitPokemon);

    return state.copyWith(pokemons: pokemons);
  }
}

/// Getting of a specific Pokemon and its details
class GetPokemonDetailsAction extends ReduxAction<AppState> {
  GetPokemonDetailsAction({required this.pokemonName});

  final String pokemonName;

  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(name: pokemonName);

    return state.copyWith(pokemonDetails: pokemonDetails);
  }
}
