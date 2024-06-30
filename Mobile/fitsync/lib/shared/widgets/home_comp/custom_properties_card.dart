import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPropertiesCard extends StatelessWidget {
  final String label1;
  final String label2;
  const CustomPropertiesCard({
    required this.label1,
    required this.label2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 65,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(19),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
              color: black2.withOpacity(0.15),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label1,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: black4,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            label2,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: gray4,
            ),
          ),
        ],
      ),
    );
  }
}
