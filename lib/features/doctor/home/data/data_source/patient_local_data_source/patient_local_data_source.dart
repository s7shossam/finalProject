import 'package:patient_appointment/features/doctor/home/data/models/patient_model.dart';

abstract class PatientLocalDataSource {
  Future<List<PatientModel>> getPatients();
  Future<void> addPatient(PatientModel patient);
  Future<void> updatePatient(int index, PatientModel updatedPatient);
  Future<void> markAsCompleted(int index);
  Future<void> markAsMissed(int index);
}
