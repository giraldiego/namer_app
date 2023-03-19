import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp()); // tells Flutter to run the app defined in MyApp.
}

/*
The code in MyApp sets up the whole app. 
It creates the app-wide state, names the app, 
defines the visual theme, and sets the "home" 
widget—the starting point of your app.
*/
class MyApp extends StatelessWidget {
  // MyApp is a Widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // This class defines de app's state
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random(); // generate a new random pair
    notifyListeners(); // ensures that anyone watching MyAppState is notified.
  }
}

class MyHomePage extends StatelessWidget {
  // This is the widget set as home in myApp
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random unbelievable idea:'),
          Text(appState.current.asLowerCase),
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
