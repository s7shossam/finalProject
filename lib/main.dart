import 'package:flutter/material.dart';
import 'package:patient_appointment/core/di/injection.dart';
import 'package:patient_appointment/core/routes/pages_route.dart';
import 'package:patient_appointment/core/routes/routes_generator.dart';
import 'package:patient_appointment/core/services/notification_service.dart';
import 'package:patient_appointment/core/services/shared_preferences_singleton.dart';
import 'package:patient_appointment/core/utils/theme.dart';
import 'package:patient_appointment/features/doctor/home/presentation/view_model/patient_provider.dart';
import 'package:provider/provider.dart';
import 'package:patient_appointment/features/doctor/home/domain/repo/patient_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await configureInjection();
  await NotificationService.init();
  // FakeDataService.generateFakePatients();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PatientProvider(getIt<PatientRepository>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PagesRoutes.splashView,
        onGenerateRoute: RoutesGenerator.onGenerateRoute,
        title: 'Patient Appointment',
        theme: themeData(context),
      ),
    );
  }
}
