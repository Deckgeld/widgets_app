import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
      body: Center(
        child: Column(
          //Centra el widget en el eje principal
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Botones
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Nulla excepteur non amet id minim mollit cillum labore enim. Qui aliquip irure est enim incididunt. In ullamco anim occaecat nulla fugiat dolor duis occaecat excepteur eu. Et adipisicing eiusmod cupidatat labore cillum reprehenderit. Dolore eiusmod excepteur veniam esse incididunt labore in labore in ipsum deserunt enim esse exercitation.')
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar Diálogo'),
            )
          ],
        ),
      ),
    );
  }

//SnackBar personalizado
  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola, soy un SnackBar personalizado'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  //Dialogo personalizado 
  void openDialog(BuildContext context) {
    showDialog(
      context: context, 
      //Hace que no se pueda cerrar el dialogo al hacer clic fuera de el
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Laborum nostrud esse sint officia Lorem excepteur id. Occaecat enim ea sunt ullamco excepteur ad eiusmod. Amet aliquip tempor culpa ipsum laborum enim mollit magna et minim non ex. Ea ad laborum esse commodo pariatur occaecat proident ex amet tempor cupidatat Lorem id.'),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }
}
