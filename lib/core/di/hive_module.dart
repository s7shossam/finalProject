// lib/core/di/hive_module.dart
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:patient_appointment/features/doctor/home/data/models/appointment_status.dart';
import 'package:patient_appointment/features/doctor/home/data/models/patient_model.dart';

@module
abstract class HiveModule {
  @preResolve
  Future<Box<PatientModel>> get patientBox async {
    await Hive.initFlutter();
    Hive.registerAdapter(PatientModelAdapter());
    Hive.registerAdapter(AppointmentStatusAdapter());
    return Hive.openBox<PatientModel>('patientsBox');
  }
}
