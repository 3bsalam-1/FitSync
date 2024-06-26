import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';
import '../global/custom_translate_text.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final double horizontalPadding;
  final double width;
  final List<Color> colors;
  final Color textColor;
  final Color borderColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.horizontalPadding = 50,
    this.width = double.infinity,
    this.colors = const [cyan, purple, purple],
    this.textColor = white,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: colors[0],
        gradient: LinearGradient(
          colors: colors,
        ),
        border: Border.all(
          width: 3,
          color: borderColor,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        child: Center(
          child: customTranslateText(
            label,
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
