import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomizeTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final IconData? suffixIcon;
  final void Function()? onPressed;
  final double horizontalPadding;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomizeTextFormField({
    super.key,
    this.icon,
    required this.hintText,
    this.suffixIcon,
    this.onPressed,
    this.horizontalPadding = 0,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: icon != null? Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 4),
            child: Icon(
              icon,
              color: gray4,
            ),
          ): null,
          suffixIcon: icon != null? Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                suffixIcon,
                color: gray3,
              ),
            ),
          ): null,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: gray3,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: purple4, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: gray3, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: gray3, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
