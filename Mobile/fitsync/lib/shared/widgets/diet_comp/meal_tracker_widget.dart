import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/custom_translate_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealTrackerWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double h;
  final String label1;
  final String label2;
  final String label3;
  final double size;
  const MealTrackerWidget({
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.h,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8, right: 6, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: width,
            height: height,
          ),
          SizedBox(
            height: h,
          ),
          customTranslateText(
            label1,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: black,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          RichText(
            text: TextSpan(
              text: label2,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: size,
                color: black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: label3,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: gray11)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
