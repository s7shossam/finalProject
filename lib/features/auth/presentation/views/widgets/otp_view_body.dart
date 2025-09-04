import 'package:flutter/material.dart';
import 'package:patient_appointment/core/routes/pages_route.dart';
import 'package:patient_appointment/core/utils/colors.dart';
import 'package:patient_appointment/core/utils/extentions.dart';
import 'package:patient_appointment/features/auth/presentation/views/widgets/pin_input_widget.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: otpFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.responsiveWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify Phone No',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: context.responsiveHeight(16)),
            Text(
              'Enter the OTP',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
            PinInputWidget(),
            SizedBox(height: context.responsiveHeight(25)),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (otpFormKey.currentState!.validate()) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      PagesRoutes.patientOrDoctorView,
                      (_) => false,
                    );
                  }
                },
                child: Text(
                  'Validate OTP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: context.responsiveHeight(38)),
            Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn’t receive the OTP? ',
                      style: TextStyle(
                        color: const Color(0xFF888888),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                      ),
                    ),
                    TextSpan(
                      text: 'Resend OTP',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
