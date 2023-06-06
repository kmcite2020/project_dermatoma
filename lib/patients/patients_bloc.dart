import 'dart:convert';

import 'package:states_rebuilder/states_rebuilder.dart';

import 'models/patient.dart';
import 'models/patients.dart';

final _patientsRM = RM.inject<Map<String, dynamic>>(
  () => {},
  persist: () => PersistState(
    key: 'patients',
    toJson: (s) => jsonEncode(s),
    fromJson: (json) => jsonDecode(json),
  ),
);
Map<String, dynamic> get patients => _patientsRM.state;

/// getters
bool get isWaiting => _patientsRM.isWaiting;
int get numberOfPatients => patients.length;
List<String> get keys => patients.keys.toList();
patientById(String id) => patients[id];

/// setters
void addPatient(int patient) {
  // _patientsRM.setState((s) => patients[patient['id']] = patient);
}

void deletePatient(patient) {
  // _patientsRM.setState((s) => patients.remove(patient['id']));
}

void deleteAllPatients() async {
  await _patientsRM.refresh();
}

class PatientsBloc {
  final patientsRM = RM.inject(
    () => Patients(
      patients: [],
    ),
    persist: () => PersistState(
      key: 'patients',
      toJson: (s) => s.toJson(),
      fromJson: (json) => Patients.fromJson(json),
      throttleDelay: 100,
    ),
  );
  getAllPatients() => patients;
  getPatients(int amount) => patients.take(amount);
  getPatientAtIndex(int index) => patients[index];
  getCurrentLength() => patients.length;

  int getCurrentIndex() => getCurrentLength() - 1;

  List<Patient> get patients => patientsRM.state.patients;
  set patients(List<Patient> value) {
    patientsRM.state = patientsRM.state.copyWith(patients: value);
    // patientsRM.stateAsync;
  }

  void addPatient(Patient patient) {
    final Patient xPatient = Patient(
      id: getCurrentIndex(),
      name: patient.name,
      age: patient.age,
      gender: patient.gender,
      picturesModel: patient.picturesModel,
    );
    patients = [xPatient, ...patients];
  }

  void deletePatient(Patient patient) {
    patients = [
      for (final eachPatient in patients)
        if (eachPatient != patient) eachPatient
    ];
  }

  void deleteAllPatients() {
    patients = [];
  }

  void updatePtient(Patient patient) {
    currentPatientRM.setToIsWaiting();
    deletePatient(patient);
    addPatient(patient);
  }

  final currentPatientRM = RM.inject<Patient?>(() => null);
  set currentPatient(Patient? value) {
    // currentPatientRM.setToIsWaiting();
    currentPatientRM.state = value;
  }

  Patient? get currentPatient => currentPatientRM.state;
}

final PatientsBloc patientsBloc = PatientsBloc();
