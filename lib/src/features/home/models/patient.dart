// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Patient {
  final String name;
  final int mr;
  final List<String> histories;
  Patient({
    required this.name,
    required this.mr,
    required this.histories,
  });

  Patient copyWith({
    String? name,
    int? mr,
    List<String>? histories,
  }) {
    return Patient(
      name: name ?? this.name,
      mr: mr ?? this.mr,
      histories: histories ?? this.histories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mr': mr,
      'histories': histories,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      name: map['name'] as String,
      mr: map['mr'] as int,
      histories: List<String>.from(
        (map['histories']),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) => Patient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Patient(name: $name, mr: $mr, histories: $histories)';

  @override
  bool operator ==(covariant Patient other) {
    if (identical(this, other)) return true;

    return other.name == name && other.mr == mr && listEquals(other.histories, histories);
  }

  @override
  int get hashCode => name.hashCode ^ mr.hashCode ^ histories.hashCode;
}
