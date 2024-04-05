//show IconData es para solo importar el IconData de material.dart
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Buttons',
    subTitle: 'Botones con estilo',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars y diálogos',
    subTitle: 'Indicadores en pantalla ',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: 'UI Controls',
    subTitle: 'Una serie de controles en flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Introduccion a la aplicación',
    subTitle: 'Tutorial introductorio',
    link: '/tutorial',
    icon: Icons.school_outlined,
  ),
  MenuItem(
    title: 'InfiniteScroll y pull',
    subTitle: 'Listas inifinitas y pull to refresh',
    link: '/inifinite',
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: 'Riverpord Counter',
    subTitle: 'Introduccion a riverpod',
    link: '/counter-river',
    icon: Icons.plus_one,
  ),
];
