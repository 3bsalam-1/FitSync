import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import '../global/custom_translate_text.dart';

class ProfileWidget1 extends StatelessWidget {
  final String imageUrl;
  final String label;
  final double scale;
  final double? w;
  final void Function()? onTap;

  const ProfileWidget1({
    required this.imageUrl,
    required this.label,
    required this.scale,
    this.w,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: w,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Image.asset(
              imageUrl,
              width: scale,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: black,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: onTap,
            icon: const Icon(
              IconlyLight.arrow_right_2,
              color: purple5,
              weight: 25,
            ))
      ],
    );
  }
}
