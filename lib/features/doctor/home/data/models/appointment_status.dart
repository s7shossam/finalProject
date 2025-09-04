import 'package:hive/hive.dart';

part 'appointment_status.g.dart';

@HiveType(typeId: 1)
enum AppointmentStatus {
  @HiveField(0)
  pending,

  @HiveField(1)
  completed,

  @HiveField(2)
  missed,
}
