import 'package:flutter/material.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

ThemeData get lightTheme {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    elevatedButtonTheme: lightElevatedButtonTheme,
  );
}

ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      elevatedButtonTheme: darkElevatedButtonTheme,
    );
ThemeMode get themeMode => themeModeRM.state;

ElevatedButtonThemeData get lightElevatedButtonTheme => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(80),
        shape: const RoundedRectangleBorder(),
      ),
    );
ElevatedButtonThemeData get darkElevatedButtonTheme => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(80),
        shape: const RoundedRectangleBorder(),
      ),
    );

final themeModeRM = RM.inject(
  () => ThemeMode.system,
);
