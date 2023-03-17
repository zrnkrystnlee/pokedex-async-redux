import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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