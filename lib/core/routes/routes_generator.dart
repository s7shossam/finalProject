import 'package:flutter/material.dart';
import 'package:patient_appointment/core/routes/pages_route.dart';
import 'package:patient_appointment/features/auth/presentation/views/auth_view.dart';
import 'package:patient_appointment/features/auth/presentation/views/opt_view.dart';
import 'package:patient_appointment/features/doctor/home/presentation/view/add_patient_view.dart';
import 'package:patient_appointment/features/doctor/home/presentation/view/patient_view.dart';
import 'package:patient_appointment/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:patient_appointment/features/patient/presentation/views/appointment_booking_view.dart';
import 'package:patient_appointment/features/patient_or_doctor/presentation/views/patient_or_doctor_view.dart';
import 'package:patient_appointment/features/splash/presentation/view/splash_view.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case PagesRoutes.homeView:
        return MaterialPageRoute(builder: (_) => const PatientsView());
      case PagesRoutes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case PagesRoutes.authView:
        return MaterialPageRoute(builder: (_) => const AuthView());
      case PagesRoutes.otpView:
        return MaterialPageRoute(builder: (_) => const OptView());
      case PagesRoutes.addPatientView:
        return MaterialPageRoute(builder: (_) => const AddPatientView());
      case PagesRoutes.patientOrDoctorView:
        return MaterialPageRoute(builder: (_) => const PatientOrDoctorView());
      case PagesRoutes.appointmentBookingView:
        return MaterialPageRoute(builder: (_) => const AddAppointmentView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Un defined route"),
            centerTitle: true,
          ),
          body: const Center(child: Text("Un defined route")),
        );
      },
    );
  }
}
