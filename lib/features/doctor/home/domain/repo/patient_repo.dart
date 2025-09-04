import 'package:patient_appointment/features/doctor/home/domain/entities/patien_entity.dart';

abstract class PatientRepository {
  Future<List<PatientEntity>> getPatients();
  Future<void> addPatient(PatientEntity patient);
  Future<void> updatePatient(int index, PatientEntity patient);
  Future<void> markAsCompleted(int index);
  Future<void> markAsMissed(int index);
}
