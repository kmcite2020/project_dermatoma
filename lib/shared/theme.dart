import 'package:flutter/material.dart';

import '../blocs/themes_bloc.dart';

ThemeData get lightTheme {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(themeBloc.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(themeBloc.borderRadius),
        ),
        foregroundColor: themeBloc.materialColor[800],
        backgroundColor: themeBloc.materialColor[200],
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: themeBloc.materialColor,
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
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(themeBloc.borderRadius)),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
      ),
    ),
    dialogBackgroundColor: Colors.amber,
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.amber,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      // fillColor: color[100],
      filled: true,
    ),
  );
}
