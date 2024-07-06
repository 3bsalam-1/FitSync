import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParametersTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const ParametersTextFormField({
    required this.label,
    required this.controller,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (386 / 428),
      height: MediaQuery.of(context).size.height * (55 / 926),
      child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: black,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 15),
            suffix: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: gray16,
                ),
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: purple4, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: gray9, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            // border:
          )),
    );
  }
}
