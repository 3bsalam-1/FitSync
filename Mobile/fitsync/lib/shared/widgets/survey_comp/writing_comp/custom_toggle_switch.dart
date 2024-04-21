import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';

class CustomToggleSwitch extends StatelessWidget {
  final void Function()? onTap1;
  final void Function()? onTap2;
  final bool isSelected;
  final String text1;
  final String text2;

  const CustomToggleSwitch({
    super.key,
    required this.onTap1,
    required this.isSelected,
    required this.onTap2,
    this.text1 = 'kg',
    this.text2 = '1bs',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: purple2,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onTap1,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 33,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isSelected ? purple2 : white,
              ),
              child: Text(
                text1,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: isSelected ? white : gray4,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onTap2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 33,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isSelected ? white : purple2,
              ),
              child: Text(
                text2,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: isSelected ? gray4 : white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
