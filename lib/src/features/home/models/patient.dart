import 'dart:convert';

import 'package:project_dermatoma/src/features/home/models/gender.dart';
import 'package:project_dermatoma/src/features/home/models/pictures.dart';

import 'bio.dart';
import 'contact.dart';
import 'medical_record.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

// Add pt.
// Name
// Age
// Gender
// Address
// Date
// Contact
// Medical record number
// Id

class Patient implements Bio {
  @override
  String address;

  @override
  String age;

  @override
  Contact contact;

  @override
  Gender gender;

  @override
  String name;
  @override
  MedicalRecord? medicalRecord;
  PicturesModel picturesModel;
  Patient({
    required this.address,
    required this.age,
    required this.contact,
    required this.gender,
    required this.name,
    required this.medicalRecord,
    required this.picturesModel,
  });

  Patient copyWith({
    String? address,
    String? age,
    Contact? contact,
    Gender? gender,
    String? name,
    MedicalRecord? medicalRecord,
    PicturesModel? picturesModel,
  }) {
    return Patient(
      address: address ?? this.address,
      age: age ?? this.age,
      contact: contact ?? this.contact,
      gender: gender ?? this.gender,
      name: name ?? this.name,
      medicalRecord: medicalRecord ?? this.medicalRecord,
      picturesModel: picturesModel ?? this.picturesModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'age': age,
      'contact': contact.toMap(),
      'gender': gender.toMap(),
      'name': name,
      'medicalRecord': medicalRecord?.toMap(),
      'picturesModel': picturesModel.toMap(),
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      address: map['address'] as String,
      age: map['age'] as String,
      contact: Contact.fromMap(map['contact'] as Map<String, dynamic>),
      gender: Gender.fromMap(map['gender']),
      name: map['name'] as String,
      medicalRecord: map['medicalRecord'] != null ? MedicalRecord.fromMap(map['medicalRecord'] as Map<String, dynamic>) : null,
      picturesModel: PicturesModel.fromMap(map['picturesModel']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) => Patient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Patient(address: $address, age: $age, contact: $contact, gender: $gender, name: $name, medicalRecord: $medicalRecord, picturesModel: $picturesModel)';
  }

  @override
  bool operator ==(covariant Patient other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.age == age &&
        other.contact == contact &&
        other.gender == gender &&
        other.name == name &&
        other.medicalRecord == medicalRecord &&
        other.picturesModel == picturesModel;
  }

  @override
  int get hashCode {
    return address.hashCode ^ age.hashCode ^ contact.hashCode ^ gender.hashCode ^ name.hashCode ^ medicalRecord.hashCode ^ picturesModel.hashCode;
  }
}
