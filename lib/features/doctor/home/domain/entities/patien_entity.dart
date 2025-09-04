import 'package:patient_appointment/features/doctor/home/data/models/appointment_status.dart';

class PatientEntity {
  final String name;
  final int age;
  final String gender;
  final DateTime appointmentTime;
  final String imageUrl;
  final AppointmentStatus status;

  PatientEntity({
    required this.name,
    required this.age,
    required this.gender,
    required this.appointmentTime,
    required this.imageUrl,
    this.status = AppointmentStatus.pending,
  });
}

