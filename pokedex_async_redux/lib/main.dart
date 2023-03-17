import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/home_page.dart';
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
        title: 'Home Page',
        home: HomePage(),
      ),
    ),
  );
}
