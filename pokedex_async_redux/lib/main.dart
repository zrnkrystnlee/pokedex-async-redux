import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/api/api_service.dart';
import 'package:pokedex_asyn_redux/home_page.dart';
import 'package:pokedex_asyn_redux/state/app_state.dart';

//TODO: Remove Future<void> and async
Future<void> main() async {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  //TODO: Remove this; for debugging purposes only
  final pokemons = await ApiService().pokemonApi.getPokemonList(offset: '0', limit: '151');
  pokemons;

  runApp(
    StoreProvider(
      store: store,
      child: const MaterialApp(
        //TODO: 'Home Page' should be placed in constant later
        title: 'Home Page',
        home: HomePage(),
      ),
    ),
  );
}