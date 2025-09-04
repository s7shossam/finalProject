import 'package:flutter/material.dart';
import 'package:patient_appointment/core/utils/extentions.dart';

class TextFiledWidget extends StatelessWidget {
  const TextFiledWidget({super.key, required this.autovalidateMode});

  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.responsiveWidth(335),
      height: context.responsiveHeight(50),
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter mobile number';
          } else if (value.length < 10) {
            return 'Please enter valid mobile number';
          }
          return null;
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF2F2F2), // background color
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: context.responsiveWidth(12),
              right: context.responsiveWidth(8),
            ),
            child: Text(
              "+20",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none, // remove default border
          ),
          hintText: "Enter mobile number",
          hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
          contentPadding: EdgeInsets.symmetric(
            vertical: context.responsiveHeight(14),
            horizontal: context.responsiveWidth(12),
          ),
        ),
      ),
    );
  }
}
