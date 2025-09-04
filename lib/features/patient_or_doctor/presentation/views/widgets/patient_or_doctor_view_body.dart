import 'package:flutter/material.dart';
import 'package:patient_appointment/core/routes/pages_route.dart';
import 'package:patient_appointment/core/widgets/primary_elevated_button.dart';

class PatientOrDoctorViewBody extends StatelessWidget {
  const PatientOrDoctorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[100], // light background
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.health_and_safety,
                  size: 60,
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Who are you?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                PrimaryElevatedButton(
                  text: "👤 I’m a Patient",
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      PagesRoutes.appointmentBookingView,
                    );
                  },
                ),
                const SizedBox(height: 20),
                PrimaryElevatedButton(
                  text: "🩺 I’m a Doctor",
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      PagesRoutes.homeView,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
