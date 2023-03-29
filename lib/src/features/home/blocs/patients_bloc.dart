import 'package:project_dermatoma/src/features/home/models/patients.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../models/patient.dart';

final patientsRM = RM.inject(
  () => Patients(
    patients: [],
  ),
  persist: () => PersistState(
    key: 'patients',
    toJson: (s) => s.toJson(),
    fromJson: (json) => Patients.fromJson(json),
  ),
);

List<Patient> get patients => patientsRM.state.patients;
set patients(List<Patient> value) => patientsRM.state = patientsRM.state.copyWith(patients: value);

addPatient(Patient patient) => patients = [patient, ...patients];
deletePatient(Patient patient) => patients = [
      for (final eachPatient in patients)
        if (eachPatient != patient) eachPatient
    ];
