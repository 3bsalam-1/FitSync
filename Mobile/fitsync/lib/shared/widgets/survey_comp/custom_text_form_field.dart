import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? initialValue;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      initialValue: initialValue,
      validator: validator,
      controller: controller,
      style: const TextStyle(
        fontSize: 26,
        color: gray3,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 26,
          color: gray3,
        ),
      ),
    );
  }
}
