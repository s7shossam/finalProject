import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:patient_appointment/features/patient_or_doctor/presentation/views/widgets/patient_or_doctor_view_body.dart';

class PatientOrDoctorView extends StatelessWidget {
  const PatientOrDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatientOrDoctorViewBody(),
    );
  }
}
