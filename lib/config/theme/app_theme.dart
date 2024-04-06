import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
];

class AppTheme {
  final bool isDarkMode;
  final int selectColor;

  AppTheme({this.selectColor = 0, this.isDarkMode = false})
      : assert(selectColor >= 0, 'Select color must be greater than 0'),
        assert(selectColor < colorList.length,
            'Select color must be less than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      //useMaterial3: true,
      colorSchemeSeed: colorList[selectColor],
      appBarTheme: const AppBarTheme(centerTitle: false));

  //Este metodo instancia una nueva clase AppTheme con los valores que se le pasen
  //Ya que los parametros de ThemeData son finales y no se pueden cambiar
  AppTheme copyWith({
    int? selectColor,
    bool? isDarkMode,
    }) => AppTheme(
      selectColor: selectColor ?? this.selectColor,
      isDarkMode: isDarkMode ?? this.isDarkMode
  );
}
