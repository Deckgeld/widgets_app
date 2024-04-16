import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //leemos valor de isDarkMode en el state de themeNotifierProvider
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Cambiar tema'),
          actions: [
            //Boton para cambiar el tema, usamos el metodo toggleDarkmode del notifier
            IconButton(
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onPressed: () {
                //usamos el notifier para cambiar el estado
                ref.read(themeNotifierProvider.notifier).toggleDarkmode();
              },
            )
          ],
        ),
        body: const _ThemeChangerView());
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //leemos el valor de colorListProvider
    final List<Color> colors = ref.watch(colorListProvider);
    //leemos el valor de selectColorProvider del state de themeNotifierProvider
    final selectedColor = ref.watch(themeNotifierProvider).selectColor;
    //final int selectedColor = ref.watch(selectColorProvider);

    return ListView.builder(
        //usamos colors para saber cuantos remderizar
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];

          //Renderizamos un RadioButton por cada color
          return RadioListTile(
            title: Text('Este color', style: TextStyle(color: color)),
            subtitle: Text('${color.value}.'),
            value: index,

            //groupValue es el valor seleccionado
            groupValue: selectedColor,
            onChanged: (value) {
              //usamos el notifier para cambiar el estado del color seleccionado
              ref.read(themeNotifierProvider.notifier).changeColor(index);
            },
          );
        });
  }
}
