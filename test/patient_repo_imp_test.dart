import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:patient_appointment/features/doctor/home/data/data_source/patient_local_data_source/patient_local_data_source.dart';
import 'package:patient_appointment/features/doctor/home/data/models/appointment_status.dart';
import 'package:patient_appointment/features/doctor/home/data/models/patient_model.dart';
import 'package:patient_appointment/features/doctor/home/data/repo/patient_repo_imp.dart';
import 'package:patient_appointment/features/doctor/home/domain/entities/patien_entity.dart';

import 'patient_repo_imp_test.mocks.dart';

/// Generate mocks for LocalDataSource & PatientModel
@GenerateMocks([PatientLocalDataSource, PatientModel])

void main() {
  late MockPatientLocalDataSource mockLocalDataSource;
  late PatientRepositoryImpl repository;

  setUp(() {
    mockLocalDataSource = MockPatientLocalDataSource();
    repository = PatientRepositoryImpl(mockLocalDataSource);
  });

  group('PatientRepositoryImpl', () {
    test('getPatients should return list of PatientEntity', () async {
      final model = PatientModel(
        name: 'Omar',
        age: 22,
        gender: 'Male',
        appointmentTime: DateTime(2025, 1, 1),
        status: AppointmentStatus.pending, imageUrl: '',
      );

      when(mockLocalDataSource.getPatients())
          .thenAnswer((_) async => [model]);

      final result = await repository.getPatients();

      expect(result, isA<List<PatientEntity>>());
      expect(result.first.name, 'Omar');
      verify(mockLocalDataSource.getPatients()).called(1);
    });

    test('addPatient should convert entity to model and call localDataSource', () async {
      final entity = PatientEntity(
        name: 'Sara',
        age: 21,
        gender: 'Female',
        appointmentTime: DateTime(2025, 2, 1),
        status: AppointmentStatus.pending, imageUrl: '',
      );

      when(mockLocalDataSource.addPatient(any))
          .thenAnswer((_) async {});

      await repository.addPatient(entity);

      verify(mockLocalDataSource.addPatient(any)).called(1);
    });

    test('updatePatient should convert entity to model and call localDataSource', () async {
      final entity = PatientEntity(
        name: 'Ali',
        age: 30,
        gender: 'Male',
        appointmentTime: DateTime(2025, 3, 1),
        status: AppointmentStatus.pending, imageUrl: '',
      );

      when(mockLocalDataSource.updatePatient(0, any))
          .thenAnswer((_) async {});

      await repository.updatePatient(0, entity);

      verify(mockLocalDataSource.updatePatient(0, any)).called(1);
    });

    test('markAsCompleted should call localDataSource.markAsCompleted', () async {
      when(mockLocalDataSource.markAsCompleted(0)).thenAnswer((_) async {});

      await repository.markAsCompleted(0);

      verify(mockLocalDataSource.markAsCompleted(0)).called(1);
    });

    test('markAsMissed should call localDataSource.markAsMissed', () async {
      when(mockLocalDataSource.markAsMissed(0)).thenAnswer((_) async {});

      await repository.markAsMissed(0);

      verify(mockLocalDataSource.markAsMissed(0)).called(1);
    });
  });
}
