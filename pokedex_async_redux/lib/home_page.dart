import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_asyn_redux/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: StoreProviders should be removed later
    StoreProvider.dispatch(context, GetPokemonsAction());
    StoreProvider.dispatch(context, GetPokemonDetailsAction(pokemonName: selectedPokemon));

    return Scaffold(
      appBar: AppBar(
        //TODO: 'Home Page' should be placed in constant later
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            //TODO: 'This is the Home Page' should be placed in constant later
            Text('This is the Home Page'),
          ],
        ),
      ),
    );
  }
}
