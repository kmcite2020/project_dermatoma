import 'dart:convert';

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
