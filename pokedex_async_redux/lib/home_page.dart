import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_asyn_redux/state/action/pokemon_actions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch(context, GetPokemonsAction());

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
