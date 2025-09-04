import 'package:flutter/material.dart';
import 'package:patient_appointment/core/utils/colors.dart';
import 'package:patient_appointment/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SplashViewBody(),
    );
  }
}
