// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;
import 'package:patient_appointment/core/di/hive_module.dart' as _i880;
import 'package:patient_appointment/features/doctor/home/data/data_source/patient_local_data_source/patient_local_data_source.dart'
    as _i913;
import 'package:patient_appointment/features/doctor/home/data/data_source/patient_local_data_source/patient_local_data_source_imp.dart'
    as _i28;
import 'package:patient_appointment/features/doctor/home/data/models/patient_model.dart'
    as _i587;
import 'package:patient_appointment/features/doctor/home/data/repo/patient_repo_imp.dart'
    as _i38;
import 'package:patient_appointment/features/doctor/home/domain/repo/patient_repo.dart'
    as _i47;
import 'package:patient_appointment/features/doctor/home/presentation/view_model/patient_provider.dart'
    as _i126;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final hiveModule = _$HiveModule();
    await gh.factoryAsync<_i986.Box<_i587.PatientModel>>(
      () => hiveModule.patientBox,
      preResolve: true,
    );
    gh.factory<_i913.PatientLocalDataSource>(() =>
        _i28.PatientLocalDataSourceImpl(gh<_i979.Box<_i587.PatientModel>>()));
    gh.factory<_i47.PatientRepository>(
        () => _i38.PatientRepositoryImpl(gh<_i913.PatientLocalDataSource>()));
    gh.factory<_i126.PatientProvider>(
        () => _i126.PatientProvider(gh<_i47.PatientRepository>()));
    return this;
  }
}

class _$HiveModule extends _i880.HiveModule {}
