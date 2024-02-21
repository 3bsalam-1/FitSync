import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final double horizontalPadding;
  final double width;
  final List<Color> colors;
  final Color shadowColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.horizontalPadding = 50,
    this.width = double.infinity,
    this.colors = const [cyan, purple, purple],
    this.shadowColor = purple2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        gradient: LinearGradient(
          colors: colors,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 2),
            color: shadowColor,
          ),
        ],
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
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
