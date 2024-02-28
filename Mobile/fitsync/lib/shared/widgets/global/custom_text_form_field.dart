import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? initialValue;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.keyboardType,
    this.fontSize = 26,
    this.textColor = gray3,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      controller: controller,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
      ),
      textAlign: textAlign,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
