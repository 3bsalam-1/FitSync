import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ProfileWidget1 extends StatelessWidget {
  String imageUrl;
  String label;
  final double scale;
  double? w;
  final void Function()? onTap;
  ProfileWidget1({
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
        Spacer(),
        IconButton(
            onPressed: onTap,
            icon: Icon(
              IconlyLight.arrow_right_2,
              color: purple5,
              weight: 25,
            ))
      ],
    );
  }
}
