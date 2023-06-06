// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class FlexSchemeX {
  final FlexSchemeData flexSchemeData;
  const FlexSchemeX({
    required this.flexSchemeData,
  });

  FlexSchemeX copyWith({
    FlexSchemeData? flexSchemeData,
  }) {
    return FlexSchemeX(
      flexSchemeData: flexSchemeData ?? this.flexSchemeData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': flexSchemeData.name,
      'description': flexSchemeData.description,
      'lp': flexSchemeData.light.primary.value,
      'lpc': flexSchemeData.light.primaryContainer.value,
      'ls': flexSchemeData.light.secondary.value,
      'lsc': flexSchemeData.light.secondaryContainer.value,
      'lt': flexSchemeData.light.tertiary.value,
      'ltc': flexSchemeData.light.tertiaryContainer.value,
      'dp': flexSchemeData.dark.primary.value,
      'dpc': flexSchemeData.dark.primaryContainer.value,
      'ds': flexSchemeData.dark.secondary.value,
      'dsc': flexSchemeData.dark.secondaryContainer.value,
      'dt': flexSchemeData.dark.tertiary.value,
      'dtc': flexSchemeData.dark.tertiaryContainer.value,
    };
  }

  factory FlexSchemeX.fromMap(Map<String, dynamic> map) {
    return FlexSchemeX(
      flexSchemeData: FlexSchemeData(
        name: map['name'],
        description: map['description'],
        light: FlexSchemeColor(
          primary: Color(map['lp']),
          secondary: Color(map['ls']),
          tertiary: Color(map['lp']),
          primaryContainer: Color(map['lpc']),
          secondaryContainer: Color(map['lsc']),
          tertiaryContainer: Color(map['ltc']),
        ),
        dark: FlexSchemeColor(
          primary: Color(map['dp']),
          secondary: Color(map['ds']),
          tertiary: Color(map['dp']),
          primaryContainer: Color(map['dpc']),
          secondaryContainer: Color(map['dsc']),
          tertiaryContainer: Color(map['dtc']),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FlexSchemeX.fromJson(String source) => FlexSchemeX.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FlexSchemeX(flexSchemeData: $flexSchemeData)';

  @override
  bool operator ==(covariant FlexSchemeX other) {
    if (identical(this, other)) return true;

    return other.flexSchemeData == flexSchemeData;
  }

  @override
  int get hashCode => flexSchemeData.hashCode;
}
