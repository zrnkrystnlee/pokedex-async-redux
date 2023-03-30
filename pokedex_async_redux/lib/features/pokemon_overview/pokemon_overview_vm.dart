import 'dart:ui';

import 'package:async_redux/async_redux.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon.dart';
import 'package:pokedex_asyn_redux/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex_asyn_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_asyn_redux/state/app_state.dart';
import 'package:pokedex_asyn_redux/utils/async.dart';
import 'package:pokedex_asyn_redux/utils/string_constants.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm(
        pokemons: _pokemons(),
        searchedPokemons: state.searchedPokemons,
        getFilteredPokemons: (searchText) => _getFilteredPokemons(searchText),
        clearSearchedPokemons: _clearSearchedPokemons,
      );

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(errorMessage);

    return Async(state.pokemons);
  }

  void _getFilteredPokemons(String searchText) => dispatchSync(SearchPokemonsAction(searchText: searchText));

  void _clearSearchedPokemons() => dispatchSync(ClearSearchedPokemonsAction());
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.pokemons,
    required this.searchedPokemons,
    required this.getFilteredPokemons,
    required this.clearSearchedPokemons,
  }) : super(equals: [pokemons, searchedPokemons]);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final VoidCallback clearSearchedPokemons;
  final Function(String) getFilteredPokemons;
}
