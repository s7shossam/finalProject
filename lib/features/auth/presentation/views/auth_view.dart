import 'package:flutter/material.dart';
import 'package:patient_appointment/features/auth/presentation/views/widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AuthViewBody());
  }
}
