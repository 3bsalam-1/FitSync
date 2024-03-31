import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';

class CustomCardIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const CustomCardIcon({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 12,
        ),
        margin: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: gray7,
            width: 0.6,
          ),
          boxShadow: [
            BoxShadow(
              color: gray7.withOpacity(0.6),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: purple4,
              size: 30,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: gray4,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: purple2,
            ),
          ],
        ),
      ),
    );
  }
}
