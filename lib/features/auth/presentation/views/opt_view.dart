import 'package:flutter/material.dart';
import 'package:patient_appointment/features/auth/presentation/views/widgets/otp_view_body.dart';

class OptView extends StatelessWidget {
  const OptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: OtpViewBody());
  }
}
