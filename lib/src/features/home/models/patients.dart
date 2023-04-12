// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'patient.dart';

class Patients {
  final List<Patient> patients;
  Patients({required this.patients});

  Patients copyWith({
    List<Patient>? patients,
  }) {
    return Patients(patients: patients ?? this.patients);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patients': patients.map((x) => x.toMap()).toList(),
    };
  }

  factory Patients.fromMap(Map<String, dynamic> map) {
    return Patients(
      patients: List<Patient>.from(
        (map['patients']).map<Patient>(
          (x) {
            return Patient.fromMap(x as Map<String, dynamic>);
          },
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Patients.fromJson(String source) => Patients.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Patients(patients: $patients)';

  @override
  bool operator ==(covariant Patients other) {
    if (identical(this, other)) return true;

    return listEquals(other.patients, patients);
  }

  @override
  int get hashCode => patients.hashCode;
}
