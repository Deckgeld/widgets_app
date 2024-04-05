import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    //El notch es la muesca que tienen algunos dispositivos en la parte superior de la pantalla
    final hasNoch = MediaQuery.of(context).padding.top > 35 ;
    

    return NavigationDrawer(
      selectedIndex: navBarIndex,
      onDestinationSelected: (value) {
        setState(() {
          navBarIndex = value;
        });
      },
      children: [

        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNoch ? 0: 20, 16, 10),
          child: const Text('Main')
        ),

        ...appMenuItems
          .sublist(0, 3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          ),),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),

          const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('Secondary')
        ),

        ...appMenuItems
          .sublist(3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          ),),


      ]
    );
  }
}