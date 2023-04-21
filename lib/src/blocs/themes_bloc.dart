// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
        foregroundColor: themeBloc.materialColor[800],
        backgroundColor: themeBloc.materialColor[200],
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: themeBloc.materialColor,
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

ThemeData get darkTheme {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: themeBloc.sizeOfButton,
        foregroundColor: themeBloc.materialColor[200],
        backgroundColor: themeBloc.materialColor[800],
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(themeBloc.borderRadius)),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}

class ThemeBloc {
  final themeModelRM = RM.inject(
    () => ThemeModel(),
    persist: () => PersistState(
      key: 'themeModel',
      toJson: (s) => s.toJson(),
      fromJson: (json) => ThemeModel.fromJson(json),
    ),
  );
  ThemeModel get model => themeModelRM.state;
  set model(ThemeModel value) => themeModelRM.state = value;
  MaterialColor get materialColor => Colors.primaries[model.materialColor ?? 0];
  ThemeMode get themeMode => ThemeMode.values[model.themeMode ?? 0];
  double get borderRadius => model.borderRadius ?? 8;
  double get padding => model.padding ?? 8;
  double get textScaleFactor => model.textScaleFactor ?? 1.4;
  String? get font => model.font;
  double get elevation => model.elevation ?? 10;
  double get height => model.height ?? 80;
  set materialColor(MaterialColor value) => model = model.copyWith(materialColor: Colors.primaries.indexOf(value));
  void updateThemeMode(ThemeMode? value) => model = model.copyWith(themeMode: ThemeMode.values.indexOf(value!));
  set borderRadius(double? value) => model = model.copyWith(borderRadius: value);
  set padding(double? value) => model = model.copyWith(padding: value);
  set textScaleFactor(double? value) => model = model.copyWith(textScaleFactor: value);
  set font(String? value) => model = model.copyWith(font: value);
  set elevation(double? value) => model = model.copyWith(elevation: value);
  set height(double? value) => model = model.copyWith(height: value);
  //! CONSTANTS
  Size get sizeOfButton => const Size.fromHeight(80);
}

final ThemeBloc themeBloc = ThemeBloc();

class ThemeModel {
  final int? materialColor;
  final int? themeMode;
  final double? borderRadius;
  final double? padding;
  final double? textScaleFactor;
  final String? font;
  final double? elevation;
  final double? height;
  ThemeModel({
    this.materialColor,
    this.themeMode,
    this.borderRadius,
    this.padding,
    this.textScaleFactor,
    this.font,
    this.elevation,
    this.height,
  });

  ThemeModel copyWith({
    int? materialColor,
    int? themeMode,
    double? borderRadius,
    double? padding,
    double? textScaleFactor,
    String? font,
    double? elevation,
    double? height,
  }) {
    return ThemeModel(
      materialColor: materialColor ?? this.materialColor,
      themeMode: themeMode ?? this.themeMode,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      font: font ?? this.font,
      elevation: elevation ?? this.elevation,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'materialColor': materialColor,
      'themeMode': themeMode,
      'borderRadius': borderRadius,
      'padding': padding,
      'textScaleFactor': textScaleFactor,
      'font': font,
      'elevation': elevation,
      'height': height,
    };
  }

  factory ThemeModel.fromMap(Map<String, dynamic> map) {
    return ThemeModel(
      materialColor: map['materialColor'] != null ? map['materialColor'] as int : null,
      themeMode: map['themeMode'] != null ? map['themeMode'] as int : null,
      borderRadius: map['borderRadius'] != null ? map['borderRadius'] as double : null,
      padding: map['padding'] != null ? map['padding'] as double : null,
      textScaleFactor: map['textScaleFactor'] != null ? map['textScaleFactor'] as double : null,
      font: map['font'] != null ? map['font'] as String : null,
      elevation: map['elevation'] != null ? map['elevation'] as double : null,
      height: map['height'] != null ? map['height'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeModel.fromJson(String source) => ThemeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ThemeModel(materialColor: $materialColor, themeMode: $themeMode, borderRadius: $borderRadius, padding: $padding, textScaleFactor: $textScaleFactor, font: $font, elevation: $elevation, height: $height)';
  }

  @override
  bool operator ==(covariant ThemeModel other) {
    if (identical(this, other)) return true;

    return other.materialColor == materialColor &&
        other.themeMode == themeMode &&
        other.borderRadius == borderRadius &&
        other.padding == padding &&
        other.textScaleFactor == textScaleFactor &&
        other.font == font &&
        other.elevation == elevation &&
        other.height == height;
  }

  @override
  int get hashCode {
    return materialColor.hashCode ^
        themeMode.hashCode ^
        borderRadius.hashCode ^
        padding.hashCode ^
        textScaleFactor.hashCode ^
        font.hashCode ^
        elevation.hashCode ^
        height.hashCode;
  }
}
