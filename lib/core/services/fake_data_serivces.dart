import 'package:hive/hive.dart';
import 'package:patient_appointment/features/doctor/home/domain/entities/patien_entity.dart';

class FakeDataService {
  static Future<void> generateFakePatients() async {
    final box = Hive.box<PatientEntity>('patients');

    if (box.isEmpty) {
      final patients = [
        PatientEntity(
          name: "Anupama Gurung",
          age: 32,
          gender: "Female",
          appointmentTime: DateTime(
            2025,
            8,
            21,
            10,
            0,
          ), // Aug 21, 2025 10:00 AM
          imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
        ),
        PatientEntity(
          name: "Deepa Gupta",
          age: 27,
          gender: "Female",
          appointmentTime: DateTime(2025, 8, 21, 10, 30),
          imageUrl: "https://randomuser.me/api/portraits/women/2.jpg",
        ),
        PatientEntity(
          name: "Rakendu Das",
          age: 28,
          gender: "Male",
          appointmentTime: DateTime(2025, 8, 20, 9, 30),
          imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
        ),
      ];

      for (var patient in patients) {
        await box.add(patient);
      }
    }
  }
}
