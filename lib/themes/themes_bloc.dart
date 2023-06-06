// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

import 'themes_state.dart';

class ThemeBloc {
  final themeStateRM = RM.inject(
    () => ThemesState(),
    persist: () => PersistState(
      key: 'themeState',
      toJson: (s) => s.toJson(),
      fromJson: (json) => ThemesState.fromJson(json),
    ),
  );
  ThemesState get x => themeStateRM.state;
  double get borderRadius => x.borderRadius;
  double get padding => x.padding;
  double get textScaleFactor => x.textScaleFactor;
  double get elevation => x.elevation;
  double get height => x.height;
  bool get darkMode => x.darkMode;
  bool get trueBlackWhite => x.trueBlackWhite ?? false;
  MaterialColor get materialColor => x.materialColor.materialColor;
  String? get font => x.font;
  set font(String? x) {
    themeStateRM.setState((_) => _.font = x);
  }

  /// methods
  void updateDarkMode(bool x) {
    themeStateRM.setState((_) => _.darkMode = x);
  }

  void updateTrueBlackWite(bool x) {
    themeStateRM.setState((_) => _.trueBlackWhite = x);
  }

  void updateBorderRadius(double x) {
    themeStateRM.setState((_) => _.borderRadius = x);
  }

  void updatePadding(double x) {
    themeStateRM.setState((_) => _.padding = x);
  }

  void updateTextScaleFactor(double x) {
    themeStateRM.setState((_) => _.textScaleFactor = x);
  }

  void updateElevation(double x) {
    themeStateRM.setState((_) => _.elevation = x);
  }

  void updateHeight(double x) {
    themeStateRM.setState((_) => _.height = x);
  }

  void updateMaterialColor(MaterialColor x) {
    themeStateRM.setState((_) => _.materialColor = x.integer);
  }

  void toggleDarkMode(bool x) {
    themeStateRM.setState((_) => _.darkMode = !darkMode);
  }

  void toggleTrueBlackWhite(bool x) {
    themeStateRM.setState((_) => _.trueBlackWhite = !trueBlackWhite);
  }

  /// CONSTANTS
  double get buttonHeight => themeBloc.height / 1.4;
  static const minTextScaleFactor = 0.9;
  static const maxTextScaleFactor = 1.3;
  static const minHeight = 80.0;
  static const maxHeight = 110.0;
  static const minPadding = 8.0;
  static const maxPadding = 16.0;
  static const minBorderRadius = 0.0;
  static const maxBorderRadius = 30.0;
  static const minElevation = 0.0;
  static const maxElevation = 30.0;
}

extension X on int {
  MaterialColor get materialColor => Colors.primaries[this];
}

extension Y on MaterialColor {
  int get integer => Colors.primaries.indexOf(this);
}

final ThemeBloc themeBloc = ThemeBloc();
