import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Provider es para valores inmutables
//StateProvider es para valores mutables
//StateNotifierProvider es para valores mutables con notificación de cambios

//Un simple booleano
// final isDarkmodeProvider = StateProvider((ref) => true);
// final selectColorProvider = StateProvider((ref) => 0);

//Listado de colores inmutables, son para que el usuario pueda seleccionar un color uno
final colorListProvider = StateProvider((ref) => colorList);


//Provider que se encarga de controlar el estado del tema de la aplicación  
//<Controllador/notifier, estado>
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

// Esta clase es la que se encarga de controlar themeNotifierProvider
class ThemeNotifier extends StateNotifier<AppTheme>{
  //super es para llamar al constructor de la clase padre
  ThemeNotifier(): super( AppTheme() );
  
  //Metodos para cambiar el estado
  void toggleDarkmode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
  void changeColor(int index){
    state = state.copyWith(selectColor: index);
  }
}