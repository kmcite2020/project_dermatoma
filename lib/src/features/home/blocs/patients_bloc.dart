import 'package:project_dermatoma/src/features/home/models/patients.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../models/patient.dart';

final patientsRM = RM.inject(
  () => Patients(patients: []),
  persist: () => PersistState(
    key: 'patients',
    toJson: (s) => s.toJson(),
    fromJson: (json) => Patients.fromJson(json),
  ),
);

List<Patient> get patients => patientsRM.state.patients;
set patients(List<Patient> value) {
  patientsRM.state = patientsRM.state.copyWith(patients: value);
  patientsRM.stateAsync;
}

void addPatient(Patient patient) => patients = [patient, ...patients];
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
