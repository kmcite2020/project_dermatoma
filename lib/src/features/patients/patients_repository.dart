// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../home/models/patient.dart';
import 'patients_datasource.dart';

abstract class PatientsInterface {
  // Future<List<Patient>> getAllPatients();
  // Future<Patient> getPatientById(String id);
  late final List<Patient> patients;
  void addPatient(Patient patient);
  void updatePatient(Patient patient);
  void deletePatient(Patient id);
  void deleteAllPatients();
  factory PatientsInterface() => const PatientsRepository(
        LocalPatientsDataSource(),
      );
}

class PatientsRepository implements PatientsInterface {
  final PatientsDataSource patientsDataSource;
  const PatientsRepository(
    this.patientsDataSource,
  );

  @override
  List<Patient> get patients {
    return [];
  }

  @override
  set patients(List<Patient> value) {}
  @override
  void addPatient(Patient patient) async => patients = [patient, ...patients];
  @override
  void deletePatient(Patient patient) {
    patients = [
      for (final eachPatient in patients)
        if (eachPatient != patient) eachPatient
    ];
  }

  @override
  void deleteAllPatients() {
    patients = [];
  }

  @override
  void updatePatient(Patient patient) {
    // deletePatient(patient);
    // addPatient(patient);
  }
}

class LocalPatientsDataSource implements PatientsDataSource {
  const LocalPatientsDataSource();
  @override
  Future<void> addPatient(Patient patient) async {}

  @override
  Future<void> deletePatient(String id) async {}

  @override
  Future<Patient> getPatient(String id) {
    // TODO: implement getPatient
    throw UnimplementedError();
  }

  @override
  Future<List<Patient>> getPatients() {
    // TODO: implement getPatients
    throw UnimplementedError();
  }

  @override
  Future<void> updatePatient(Patient patient) {
    // TODO: implement updatePatient
    throw UnimplementedError();
  }
}
