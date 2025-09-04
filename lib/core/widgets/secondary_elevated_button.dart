import 'package:flutter/material.dart';
import 'package:patient_appointment/core/utils/colors.dart';
import 'package:patient_appointment/core/utils/extentions.dart';

class SecondaryElevatedButton extends StatelessWidget {
  const SecondaryElevatedButton({
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
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: context.responsiveWidth(1),
              color: const Color(0xFFCCCCCC),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: context.responsiveFontSize(16),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
