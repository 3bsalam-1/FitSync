import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';
import '../global/custom_translate_text.dart';
class CustomCircleInfo extends StatelessWidget {
  final double progress;
  final String label;
  final Color color;

  const CustomCircleInfo({
    super.key,
    required this.progress,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1),
          duration: const Duration(seconds: 5),
          builder: (context, value, _) => Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 42,
                width: 42,
                child: CircularProgressIndicator(
                  value: (value <= progress / 100) ? value : progress / 100,
                  backgroundColor: gray3.withOpacity(0.1),
                  color: color,
                  strokeWidth: 5.0,
                  strokeCap: StrokeCap.round,
                ),
              ),
              customTranslateText(
                progress.toStringAsFixed(0),
                style: GoogleFonts.poppins(
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        customTranslateText(
          label,
          style: GoogleFonts.poppins(
            color: black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
