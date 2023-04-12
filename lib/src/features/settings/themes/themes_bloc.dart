import 'package:flutter/material.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

ThemeData get lightTheme {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(80),
        shape: const RoundedRectangleBorder(),
        foregroundColor: color[800],
        backgroundColor: color[200],
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: color[200],
    ),
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    // dropdownMenuTheme: DropdownMenuThemeData(
    //   menuStyle: MenuStyle(
    //       backgroundColor: MaterialStateProperty.resolveWith(
    //     (_) => Colors.amber,
    //   )),
    // ),
    // dialogBackgroundColor: Colors.amber,
    // popupMenuTheme: const PopupMenuThemeData(
    //   color: Colors.amber,
    // ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      // fillColor: color[100],
      filled: true,
    ),
  );
}

ThemeData get darkTheme {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: sizeOfButton,
        foregroundColor: color[200],
        backgroundColor: color[800],
        shape: const RoundedRectangleBorder(),
      ),
    ),
    // appBarTheme: ,
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      // fillColor: color[100],
      filled: true,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}

ThemeMode get themeMode => themeModeRM.state;

final themeModeRM = RM.inject(
  () => ThemeMode.system,
);

MaterialColor get color => Colors.blue;
Size get sizeOfButton => const Size.fromHeight(80);
double get borderRadius => 8;
