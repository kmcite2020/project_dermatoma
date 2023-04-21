// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:project_dermatoma/models/pictures.dart';

class Patient {
  final String? name;
  final int? age; // in milliseconds
  final int? gender;
  final PicturesModel? picturesModel;

  Patient({
    this.name,
    this.age,
    this.gender,
    this.picturesModel,
  });

  Patient copyWith({
    String? name,
    int? age,
    int? gender,
    PicturesModel? picturesModel,
  }) {
    return Patient(
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      picturesModel: picturesModel ?? this.picturesModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'gender': gender,
      'picturesModel': picturesModel?.toMap(),
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      name: map['name'] != null ? map['name'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      gender: map['gender'] != null ? map['gender'] as int : null,
      picturesModel: map['picturesModel'] != null ? PicturesModel.fromMap(map['picturesModel'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) => Patient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Patient(name: $name, age: $age, gender: $gender, picturesModel: $picturesModel)';
  }

  @override
  bool operator ==(covariant Patient other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age && other.gender == gender && other.picturesModel == picturesModel;
  }

  @override
  int get hashCode {
    return name.hashCode ^ age.hashCode ^ gender.hashCode ^ picturesModel.hashCode;
  }
}
