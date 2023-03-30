import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:dartx/dartx.dart';
import 'package:pokedex_asyn_redux/api/api_service.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon.dart';
import 'package:pokedex_asyn_redux/state/action/actions.dart';
import 'package:pokedex_asyn_redux/state/app_state.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';

/// Getting of Pokemons from Pokemon API
class GetPokemonsAction extends LoadingAction {
  static const key = 'get-pokemons-action';

  GetPokemonsAction() : super(actionKey: key);

  @override
  Future<AppState> reduce() async {
    final pokemons = await ApiService().pokemonApi.getPokemonList(offset: offsetPokemon, limit: limitPokemon);

    return state.copyWith(pokemons: pokemons);
  }
}

/// Getting of a specific Pokemon and its details
class GetPokemonDetailsAction extends LoadingAction {
  static const key = 'get-pokemons-details-action';

  GetPokemonDetailsAction({required this.pokemonName}) : super(actionKey: key);

  final String pokemonName;

  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(name: pokemonName);
    return state.copyWith(pokemonDetails: pokemonDetails);
  }
}

/// Dispose current details when triggering back button on a Pokemon Details Page
class ClearPokemonDetailsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(pokemonDetails: null);
}

/// Action for searching a specific pokemon
class SearchPokemonsAction extends ReduxAction<AppState> {
  SearchPokemonsAction({required this.searchText});

  final String searchText;

  @override
  AppState reduce() {
    final allPokemons = state.pokemons;
    List<Pokemon> searchedPokemons =
        allPokemons.filter((pokemon) => pokemon.name.contains(searchText.toLowerCase())).toList();
    return state.copyWith(searchedPokemons: searchedPokemons);
  }
}

/// Clearing Searched Pokemon on the store
class ClearSearchedPokemonsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(searchedPokemons: List.empty());
}
