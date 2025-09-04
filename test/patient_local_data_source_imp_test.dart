import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';
import 'package:patient_appointment/features/doctor/home/data/data_source/patient_local_data_source/patient_local_data_source_imp.dart';
import 'package:patient_appointment/features/doctor/home/data/models/appointment_status.dart';
import 'package:patient_appointment/features/doctor/home/data/models/patient_model.dart';
import 'patient_local_data_source_imp_test.mocks.dart';
/// Generate mocks for Box and PatientModel
@GenerateMocks([Box, PatientModel])

void main() {
  late MockBox<PatientModel> mockBox;
  late PatientLocalDataSourceImpl dataSource;

  setUp(() {
    mockBox = MockBox<PatientModel>();
    dataSource = PatientLocalDataSourceImpl(mockBox);
  });

  group('PatientLocalDataSourceImpl', () {
    test('getPatients should return all patients', () async {
      final patient = MockPatientModel();

      when(mockBox.values).thenReturn([patient]);

      final result = await dataSource.getPatients();

      expect(result, [patient]);
      verify(mockBox.values).called(1);
    });

    test('addPatient should call box.add', () async {
      final patient = MockPatientModel();

      when(mockBox.add(patient)).thenAnswer((_) async => 0);

      await dataSource.addPatient(patient);

      verify(mockBox.add(patient)).called(1);
    });

    test('updatePatient should call box.putAt', () async {
      final patient = MockPatientModel();

      when(mockBox.putAt(0, patient)).thenAnswer((_) async {});

      await dataSource.updatePatient(0, patient);

      verify(mockBox.putAt(0, patient)).called(1);
    });

    test('markAsCompleted should update patient status and call save', () async {
      final patient = MockPatientModel();

      when(mockBox.getAt(0)).thenReturn(patient);
      when(patient.save()).thenAnswer((_) async {});
      when(patient.status).thenReturn(AppointmentStatus.pending);

      await dataSource.markAsCompleted(0);

      verify(mockBox.getAt(0)).called(1);
      verify(patient.status = AppointmentStatus.completed).called(1);
      verify(patient.save()).called(1);
    });

    test('markAsMissed should update patient status and call save', () async {
      final patient = MockPatientModel();

      when(mockBox.getAt(0)).thenReturn(patient);
      when(patient.save()).thenAnswer((_) async {});
      when(patient.status).thenReturn(AppointmentStatus.pending);

      await dataSource.markAsMissed(0);

      verify(mockBox.getAt(0)).called(1);
      verify(patient.status = AppointmentStatus.missed).called(1);
      verify(patient.save()).called(1);
    });
  });
}
