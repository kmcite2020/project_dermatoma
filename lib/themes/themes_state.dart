import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ThemesState {
  int materialColor;
  bool darkMode;
  bool? trueBlackWhite;
  double borderRadius;
  double padding;
  double textScaleFactor;
  String? font;
  double elevation;
  double height;
  ThemesState({
    this.materialColor = 0,
    this.darkMode = false,
    this.trueBlackWhite = false,
    this.borderRadius = 8,
    this.padding = 8,
    this.textScaleFactor = 1,
    this.font,
    this.elevation = 8,
    this.height = 80,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'materialColor': materialColor,
      'darkMode': darkMode,
      'trueBlackWhite': trueBlackWhite,
      'borderRadius': borderRadius,
      'padding': padding,
      'textScaleFactor': textScaleFactor,
      'font': font,
      'elevation': elevation,
      'height': height,
    };
  }

  factory ThemesState.fromMap(Map<String, dynamic> map) {
    return ThemesState(
      materialColor: map['materialColor'] as int,
      darkMode: map['darkMode'] as bool,
      trueBlackWhite: map['trueBlackWhite'],
      borderRadius: map['borderRadius'] as double,
      padding: map['padding'] as double,
      textScaleFactor: map['textScaleFactor'] as double,
      font: map['font'] != null ? map['font'] as String : null,
      elevation: map['elevation'] as double,
      height: map['height'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemesState.fromJson(String source) => ThemesState.fromMap(json.decode(source) as Map<String, dynamic>);

  ThemesState copyWith({
    int? materialColor,
    bool? darkMode,
    double? borderRadius,
    double? padding,
    double? textScaleFactor,
    String? font,
    double? elevation,
    double? height,
  }) {
    return ThemesState(
      materialColor: materialColor ?? this.materialColor,
      darkMode: darkMode ?? this.darkMode,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      font: font ?? this.font,
      elevation: elevation ?? this.elevation,
      height: height ?? this.height,
    );
  }
}
