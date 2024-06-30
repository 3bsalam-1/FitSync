import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/colors.dart';

class CustomStartButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomStartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        margin: const EdgeInsets.only(bottom: 22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: purple5,
          ),
        ),
        child: Text(
          'Start Now',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
