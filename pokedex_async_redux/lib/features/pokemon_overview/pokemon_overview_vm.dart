import 'package:async_redux/async_redux.dart';
import 'package:pokedex_asyn_redux/api/model/pokemon.dart';
import 'package:pokedex_asyn_redux/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex_asyn_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_asyn_redux/state/app_state.dart';
import 'package:pokedex_asyn_redux/utils/async.dart';
import 'package:pokedex_asyn_redux/utils/constants.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm(pokemons: _pokemons());

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(errorMessage);

    return Async(state.pokemons);
  }
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.pokemons,
  }) : super(equals: [pokemons]);

  final Async<List<Pokemon>> pokemons;
}
