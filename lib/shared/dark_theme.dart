import 'package:flutter/material.dart';

import '../blocs/themes_bloc.dart';

ThemeData get darkTheme {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: themeBloc.materialColor,
      centerTitle: true,
      toolbarHeight: themeBloc.height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(themeBloc.borderRadius),
      ),
      elevation: themeBloc.elevation,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: themeBloc.materialColor,
      elevation: themeBloc.elevation,
      height: themeBloc.height,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(themeBloc.borderRadius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(themeBloc.buttonHeight),
        foregroundColor: themeBloc.materialColor[200],
        backgroundColor: themeBloc.materialColor[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeBloc.borderRadius),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      filled: true,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(themeBloc.borderRadius)),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
