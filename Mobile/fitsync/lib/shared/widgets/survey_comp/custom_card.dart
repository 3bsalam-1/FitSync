import 'package:google_fonts/google_fonts.dart';

import '../../colors/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final Color borderColor;
  final void Function()? onTap;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onTap,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(
              width: 2,
              color: borderColor,
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
                color: black2.withOpacity(0.2),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20, 
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset(
                imagePath,
                width: 78,
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
