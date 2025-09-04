import 'package:flutter/material.dart';
import 'package:patient_appointment/core/routes/pages_route.dart';
import 'package:patient_appointment/core/services/shared_preferences_singleton.dart';
import 'package:patient_appointment/core/utils/constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushNamed(
          context,
         PagesRoutes.onBoardingView,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/images/splash_logo.png'));
  }
}
