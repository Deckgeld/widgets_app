import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Progress Indicators'),
        ),
        body: const _ProgressView());
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        SizedBox(height: 10),
        Text('Circular Progress Indicator'),
        SizedBox(height: 10),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black45,
        ),
        SizedBox(height: 20),
        Text('Progress y linear contolado'),
        _ControlledProgresIndicator(),
      ]),
    );
  }
}

class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator();

  @override
  Widget build(BuildContext context) {
    //streambuilder es un widget que cambia en tiempo de ejecución
    return StreamBuilder(
      stream: Stream.periodic(const Duration( milliseconds: 300 ), (value){
        return value * 2 /100 ;
      }).takeWhile((value) => value <= 100),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator( value: progressValue, strokeWidth: 2, backgroundColor: Colors.grey, ),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator( value: progressValue, )
                )
            ],
          ),
        );
      }
    );
  }
}
