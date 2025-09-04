import 'package:hive/hive.dart';
import 'package:patient_appointment/features/doctor/home/data/models/appointment_status.dart';
import 'package:patient_appointment/features/doctor/home/domain/entities/patien_entity.dart';

part 'patient_model.g.dart';

@HiveType(typeId: 0)
class PatientModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  String gender;

  @HiveField(3)
  DateTime appointmentTime;

  @HiveField(4)
  String imageUrl;

  @HiveField(5) // new field
  AppointmentStatus status;

  PatientModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.appointmentTime,
    required this.imageUrl,
    this.status = AppointmentStatus.pending, // default
  });

  PatientEntity toEntity() => PatientEntity(
    name: name,
    age: age,
    gender: gender,
    appointmentTime: appointmentTime,
    imageUrl: imageUrl,
    status: status, // pass it to entity toao
  );

  static PatientModel fromEntity(PatientEntity entity) => PatientModel(
    name: entity.name,
    age: entity.age,
    gender: entity.gender,
    appointmentTime: entity.appointmentTime,
    imageUrl: entity.imageUrl,
    status: entity.status ?? AppointmentStatus.pending, // default if null
  );
}
