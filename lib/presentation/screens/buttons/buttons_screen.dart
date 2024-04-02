import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buttons screen'),
          centerTitle: false,
        ),
        body: const _ButtonsView(),
        //Boton flotante para regresar a la pantalla anterior
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      //El ancho del widget es igual al ancho del padre
      width: double.infinity,
      child: Padding(
        //Agrega un espacio alrededor del widget
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //Wrap es un widget que muestra a sus hijos en horizontal
        child: Wrap(
          //Da un espacio de 10 entre los elementos
          spacing: 10,
          //Alinea los elementos en el centro
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated Button')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated disable')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.accessibility_new),
                label: const Text('Filled Icon')),
            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.terminal),
                label: const Text('Outline Icon')),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_box_outlined),
                label: const Text('Text Icon')),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)),
            ),
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    //ClipRRect es un widget que recorta sus hijos con un radio de esquina
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      //Material es un widget que implementa el diseño de Material Design
      child: Material(
        color: colors.primary,
        //InkWell es un widget que implementa la interacción táctil
        child: const InkWell (
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
