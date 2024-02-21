import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';

class DailyInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const DailyInfoItem({
    super.key,
    required this.label,
    required this.value,
    this.icon = Icons.local_fire_department_sharp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: purple5,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: purple5,
            ),
            const SizedBox(width: 3),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: gray15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
