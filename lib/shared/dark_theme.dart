// import 'package:flutter/material.dart';

// import '../themes/themes_bloc.dart';
// import '../themes/theme.dart';

// ThemeData get darkTheme {
//   return ThemeData(
//     brightness: Brightness.dark,
//     useMaterial3: true,
//     appBarTheme: AppBarTheme(
//       backgroundColor: themeBloc.materialColor,
//       centerTitle: true,
//       toolbarHeight: themeBloc.height,
//       shape: roundedRectangleBorder(),
//       elevation: themeBloc.elevation,
//     ),
//     navigationBarTheme: NavigationBarThemeData(
//       backgroundColor: themeBloc.materialColor,
//       elevation: themeBloc.elevation,
//       height: themeBloc.height,
//       indicatorShape: roundedRectangleBorder(),
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         elevation: themeBloc.elevation,
//         minimumSize: Size.fromHeight(themeBloc.buttonHeight),
//         foregroundColor: themeBloc.materialColor[200],
//         backgroundColor: themeBloc.materialColor[800],
//         shape: roundedRectangleBorder(),
//       ),
//     ),
//     scaffoldBackgroundColor: Colors.black,
//     inputDecorationTheme: InputDecorationTheme(
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(themeBloc.borderRadius)),
//       filled: true,
//     ),
//     cardTheme: CardTheme(
//       shape: roundedRectangleBorder(),
//       elevation: themeBloc.elevation,
//     ),
//     listTileTheme: ListTileThemeData(
//       shape: roundedRectangleBorder(),
//     ),
//     floatingActionButtonTheme: FloatingActionButtonThemeData(
//       shape: roundedRectangleBorder(),
//       elevation: themeBloc.elevation,
//       foregroundColor: themeBloc.materialColor[200],
//       backgroundColor: themeBloc.materialColor[800],
//     ),
//   );
// }
