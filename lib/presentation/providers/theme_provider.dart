import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Un simple booleano
final isDarkmodeProvider = StateProvider((ref) => true);

final selectColorProvider = StateProvider((ref) => 0);

//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);
