import '../home/models/patient.dart';
import 'patients_repository.dart';

abstract class PatientsDataSource {
  Future<List<Patient>> getPatients();
  Future<Patient> getPatient(String id);
  Future<void> addPatient(Patient patient);
  Future<void> updatePatient(Patient patient);
  Future<void> deletePatient(String id);
  factory PatientsDataSource() => const LocalPatientsDataSource();
}
