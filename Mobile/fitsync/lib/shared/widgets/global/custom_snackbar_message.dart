import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';

class CustomSnackbarMessage extends StatelessWidget {
  final Color backColor;
  final IconData icon;
  final String title;
  final String subTitle;
  final Color contentColor;

  const CustomSnackbarMessage({
    super.key,
    required this.backColor,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.contentColor = white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backColor,
        boxShadow: [
          BoxShadow(
            color: gray2.withOpacity(0.6),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 25,
            color: white,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: contentColor,
                  ),
                ),
                Text(
                  subTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: contentColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 22),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
            },
            icon: Icon(
              Icons.clear,
              color: contentColor,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
