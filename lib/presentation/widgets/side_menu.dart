import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  //Creamos una referencia al estado actual del Scaffold, para poder cerrar el drawer
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    //El notch es la muesca que tienen algunos dispositivos en la parte superior de la pantalla
    final hasNoch = MediaQuery.of(context).padding.top > 35;

    return NavigationDrawer(
        //Controlamos el estado del item seleccionado
        selectedIndex: navBarIndex,
        //Metodo que se ejecuata cuando se selecciona un item
        onDestinationSelected: (value) {
          //value es el indice del item seleccionado y llamamos al metodo setState para actualizar el estado
          setState(() {});

          //Obtenemos el menuItem seleccionado
          final menuItem = appMenuItems[value];
          //Navegamos a la ruta del menuItem seleccionado
          context.push(menuItem.link);
          //Cerramos el drawer,
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        //Este menu esta dividido en 2 partes, con el widget Divider
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(28, hasNoch ? 0 : 20, 16, 10),
              child: const Text('Main')),

          //... es operador se utiliza para insertar todos los elementos de una colección en otra colección
          ...appMenuItems.sublist(0, 3).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
              child: Text('Secondary')),
          ...appMenuItems.sublist(3).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
        ]);
  }
}
