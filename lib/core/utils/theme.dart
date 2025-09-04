import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_appointment/core/utils/colors.dart';
import 'package:patient_appointment/core/utils/extentions.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.interTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          context.responsiveWidth(335),
          context.responsiveHeight(50),
        ),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          fontSize: context.responsiveFontSize(16),
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
