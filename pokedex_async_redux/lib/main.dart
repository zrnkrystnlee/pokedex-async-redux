import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex_asyn_redux/state/app_state.dart';

void main() {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  runApp(
    StoreProvider(
      store: store,
      child: const MaterialApp(
        home: PokemonOverviewConnector(),
      ),
    ),
  );
}
