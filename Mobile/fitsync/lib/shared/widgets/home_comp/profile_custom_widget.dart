import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ProfileWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function()? onPressed;

  const ProfileWidget({
    required this.label,
    required this.icon,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 21),
          child: Icon(
            icon,
            color: purple5,
            weight: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: black,
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            IconlyLight.arrow_right_2,
            color: purple5,
            weight: 25,
          ),
        ),
      ],
    );
  }
}
