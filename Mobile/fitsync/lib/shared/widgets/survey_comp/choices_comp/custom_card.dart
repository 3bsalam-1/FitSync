import 'package:google_fonts/google_fonts.dart';

import '../../../colors/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String label;
  final Color bgColor;
  final IconData icon;
  final void Function()? onTap;

  const CustomCard({
    super.key,
    required this.label,
    required this.onTap,
    required this.bgColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 75,
              color: white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
