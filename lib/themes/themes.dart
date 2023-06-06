import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'themes_bloc.dart';

double get navigationBarSelectedLabelSize => themeBloc.textScaleFactor * 14;
Size get buttonMinSize => Size.fromHeight(themeBloc.height);
ColorScheme get colorScheme => ColorScheme.fromSwatch(primarySwatch: themeBloc.materialColor);
ThemeData get themes => themeBloc.darkMode
    ? FlexThemeData.dark(
        colors: cerolina.dark,
        subThemesData: FlexSubThemesData(
          defaultRadius: themeBloc.borderRadius,
          buttonMinSize: buttonMinSize,
          navigationBarHeight: themeBloc.height,
          navigationBarElevation: themeBloc.elevation,
          navigationBarIndicatorRadius: themeBloc.borderRadius,
          navigationBarSelectedLabelSize: navigationBarSelectedLabelSize,
        ),
        useMaterial3: true,
        darkIsTrueBlack: themeBloc.trueBlackWhite,
      ).copyWith(
        // listTileTheme: ListTileThemeData(
        //   tileColor: themeBloc.materialColor,
        // ),
        )
    : FlexThemeData.light(
        colors: cerolina.light,
        subThemesData: FlexSubThemesData(
          defaultRadius: themeBloc.borderRadius,
          buttonMinSize: buttonMinSize,
          navigationBarHeight: themeBloc.height,
          navigationBarElevation: themeBloc.elevation,
          navigationBarIndicatorRadius: themeBloc.borderRadius,
          navigationBarSelectedLabelSize: navigationBarSelectedLabelSize,
        ),
        useMaterial3: true,
        lightIsWhite: themeBloc.trueBlackWhite,
      ).copyWith(
        // listTileTheme: ListTileThemeData(
        //   tileColor: themeBloc.materialColor,
        // ),
        );
FlexSchemeData cerolina = FlexSchemeData(
  name: 'Cerolina',
  description: 'Conjuredan, custom definition of all colors',
  light: FlexSchemeColor(
    primary: themeBloc.materialColor.shade800,
    primaryContainer: themeBloc.materialColor.shade300,
    secondary: themeBloc.materialColor.shade100,
    secondaryContainer: themeBloc.materialColor.shade500,
    tertiary: themeBloc.materialColor.shade700,
    tertiaryContainer: themeBloc.materialColor.shade900,
  ),
  dark: FlexSchemeColor(
    primary: themeBloc.materialColor.shade200,
    primaryContainer: themeBloc.materialColor.shade700,
    secondary: themeBloc.materialColor.shade800,
    secondaryContainer: themeBloc.materialColor.shade500,
    tertiary: themeBloc.materialColor.shade300,
    tertiaryContainer: themeBloc.materialColor.shade100,
  ),
);
