import 'package:flutter/material.dart';

void main() {
  runApp(SolitaireApp());
}

class SolitaireApp extends StatelessWidget {
  const SolitaireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solitaire-App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SolitaireGame(),
    );
  }
}

class SolitaireGame extends StatefulWidget {
  const SolitaireGame({super.key});

  @override
  _SolitaireGameState createState() => _SolitaireGameState();
}

class _SolitaireGameState extends State<SolitaireGame> {
  List<int> deck = List.generate(52, (index) => index)..shuffle();
  List<int> foundation = [];
  List<int> tableau = [];
  List<int> waste = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solitaire'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 24, 111, 27),
                    child: Center(
                      child: Text('Foundation'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.red,
                    child: Center(
                      child: Text('Tableau'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text('Waste'),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (deck.isNotEmpty) {
                  waste.add(deck.removeLast());
                } else {
                  deck.addAll(waste.reversed);
                  waste.clear();
                }
              });
            },
            child: Text('Draw'),
          ),
        ],
      ),
    );
  }
}
