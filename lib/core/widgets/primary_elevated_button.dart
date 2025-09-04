import 'package:flutter/material.dart';
import 'package:patient_appointment/core/utils/colors.dart';
import 'package:patient_appointment/core/utils/extentions.dart';

class PrimaryElevatedButton extends StatelessWidget {
  const PrimaryElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.responsiveWidth(160),
        height: context.responsiveHeight(50),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),

        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.responsiveFontSize(16),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
