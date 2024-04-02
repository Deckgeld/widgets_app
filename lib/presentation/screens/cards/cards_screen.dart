import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //scaffold es un widget que implementa la estructura visual básica de una aplicación
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cards screen'),
          centerTitle: false,
        ),
        body: const Placeholder()
      );
  }
}