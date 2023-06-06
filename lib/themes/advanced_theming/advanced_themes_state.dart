// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'flex_scheme_x.dart';

class AdvancedThemesState {
  static const defaultScheme = FlexSchemeData(
    name: 'Material Xedo',
    description: 'A blue blur of sky',
    light: FlexSchemeColor(
      primary: Colors.purple,
      secondary: Colors.green,
      tertiary: Colors.yellow,
      primaryContainer: Colors.pink,
      secondaryContainer: Colors.teal,
      tertiaryContainer: Colors.amber,
    ),
    dark: FlexSchemeColor(
      primary: Colors.pink,
      secondary: Colors.yellow,
      tertiary: Colors.green,
      primaryContainer: Colors.purple,
      secondaryContainer: Colors.teal,
      tertiaryContainer: Colors.amber,
    ),
  );
  static const defaultSchemeList = [
    FlexSchemeX(flexSchemeData: defaultScheme),
  ];
  List<FlexSchemeX> schemes;

  FlexSchemeX flexSchemeX;
  AdvancedThemesState({
    this.schemes = defaultSchemeList,
    this.flexSchemeX = const FlexSchemeX(flexSchemeData: defaultScheme),
  });

  AdvancedThemesState copyWith({
    List<FlexSchemeX>? schemes,
    FlexSchemeX? flexSchemeX,
  }) {
    return AdvancedThemesState(
      schemes: schemes ?? this.schemes,
      flexSchemeX: flexSchemeX ?? this.flexSchemeX,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'schemes': schemes.map((x) => x.toMap()).toList(),
      'flexSchemeX': flexSchemeX.toMap(),
    };
  }

  factory AdvancedThemesState.fromMap(Map<String, dynamic> map) {
    return AdvancedThemesState(
      schemes: List<FlexSchemeX>.from(
        (map['schemes']).map<FlexSchemeX>(
          (x) => FlexSchemeX.fromMap(x as Map<String, dynamic>),
        ),
      ),
      flexSchemeX: FlexSchemeX.fromMap(map['flexSchemeX'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdvancedThemesState.fromJson(String source) => AdvancedThemesState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AdvancedThemesState(schemes: $schemes, flexSchemeX: $flexSchemeX)';

  @override
  bool operator ==(covariant AdvancedThemesState other) {
    if (identical(this, other)) return true;

    return listEquals(other.schemes, schemes) && other.flexSchemeX == flexSchemeX;
  }

  @override
  int get hashCode => schemes.hashCode ^ flexSchemeX.hashCode;
}
