import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  //Agregar el parametro ref, para poder acceder a los providers
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleDarkmode();
              },
            )
          ],
        ),
        body: Center(
          child: Text('Valor $clickCounter', style: Theme.of(context).textTheme.titleLarge,),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Caulquier de las dos formas es valida
            //Dentro de una funcion no se puede usar ref.watch ya que no es un widget
            ref.read(counterProvider.notifier).state++;
            // ref.read(counterProvider.notifier).update((state) => state + 1);
          },
          child: const Icon(Icons.add),
        )
    );
  }
}
