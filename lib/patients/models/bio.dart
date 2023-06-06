import 'contact.dart';
import 'gender.dart';
import 'medical_record.dart';

abstract class Bio {
  late final String? name;
  late final String? age;
  late final Gender? gender;
  late final String? address;
  late final Contact? contact;
  late final MedicalRecord? medicalRecord;
}
