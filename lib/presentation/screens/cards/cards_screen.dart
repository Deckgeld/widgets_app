import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //scaffold es un widget que implementa la estructura visual básica de una aplicación
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cards screen'),
          centerTitle: false,
        ),
        body: const _CardsView());
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    //SingleChildScrollView es un widget que permite desplazar su contenido
    return SingleChildScrollView(
      child: Column(
        children: [
          //map es un método que recorre una lista y retorna una nueva lista
          ...cards.map((card) =>
              _CardType1(elevation: card['elevation'], label: card['label'])
          ),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CardType1({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: elevation,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.more_vert_outlined),
                      onPressed: () {},
                    )
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text( label ),
                )
              ],
            )));
  }
}
