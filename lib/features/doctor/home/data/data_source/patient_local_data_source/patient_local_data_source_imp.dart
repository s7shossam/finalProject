import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:patient_appointment/features/doctor/home/data/data_source/patient_local_data_source/patient_local_data_source.dart';
import 'package:patient_appointment/features/doctor/home/data/models/appointment_status.dart';
import 'package:patient_appointment/features/doctor/home/data/models/patient_model.dart';

@Injectable(as: PatientLocalDataSource)
class PatientLocalDataSourceImpl implements PatientLocalDataSource {
  final Box<PatientModel> box;

  PatientLocalDataSourceImpl(this.box);

  @override
  Future<List<PatientModel>> getPatients() async {
    return box.values.toList();
  }

  @override
  Future<void> addPatient(PatientModel patient) async {
    final id = await box.add(patient);
    // await NotificationService.scheduleNotification(
    //   id: id, // unique ID for each patient
    //   title: 'Appointment Reminder',
    //   body: '${patient.name} has an appointment at ${patient.appointmentTime}',
    //   scheduledDate: patient.appointmentTime,
    // ).then((value) {
    //   log('Notification scheduled');
    // });
  }

  @override
  Future<void> updatePatient(int index, PatientModel updatedPatient) async {
    await box.putAt(index, updatedPatient);
  }

  @override
  Future<void> markAsCompleted(int index) async {
    final patient = box.getAt(index);
    if (patient != null) {
      patient.status = AppointmentStatus.completed;
      await patient.save();
    }
  }

  @override
  Future<void> markAsMissed(int index) async {
    final patient = box.getAt(index);
    if (patient != null) {
      patient.status = AppointmentStatus.missed;
      await patient.save();
    }
  }
}
