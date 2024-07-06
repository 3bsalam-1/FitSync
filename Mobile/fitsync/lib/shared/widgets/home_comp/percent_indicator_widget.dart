import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicatorWidget extends StatelessWidget {
  final Color color;
  final int label1;
  final String label2;

  const PercentIndicatorWidget({
    required this.color,
    required this.label1,
    required this.label2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularPercentIndicator(
          backgroundColor: gray23,
          reverse: true,
          radius: 22.0,
          lineWidth: 5.0,
          percent: (label1 / 100),
          progressColor: color,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(
            label1.toString(),
            style: GoogleFonts.overpass(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: black,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          label2,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: black,
          ),
        ),
      ],
    );
  }
}
