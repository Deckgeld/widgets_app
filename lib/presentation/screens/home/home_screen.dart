import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter + material 3'),
          centerTitle: false,
        ),
        body: const _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTitle(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    //themeof: F1 > userSnippets > dart.json > prefix > 'themeof'
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      //Icono a la izquierda
      leading: Icon(menuItem.icon),
      //Icono a la derecha
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,),

      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      iconColor: colors.primary,

      onTap: () {
        //TODO: Navegar a la pantalla seleccionada
      },
    );
  }
}
