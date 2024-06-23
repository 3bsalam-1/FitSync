import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';
import '../../global/custom_translate_text.dart';

class SleepInformation extends StatelessWidget {
  final String value;
  final String title;

  const SleepInformation({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 6,
              backgroundColor: purple5,
            ),
            const SizedBox(width: 3),
            customTranslateText(
              title,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: gray10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
