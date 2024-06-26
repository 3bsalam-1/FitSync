import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';
import '../global/custom_translate_text.dart';

class SquareInfo extends StatelessWidget {
  final String value;
  final String title;

  const SquareInfo({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: white,
        boxShadow: [
          BoxShadow(
            color: gray7.withOpacity(0.4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customTranslateText(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: black,
              fontWeight: FontWeight.w700,
            ),
          ),
          customTranslateText(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: gray4,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
