import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';

SnackBar customSnackbarMessage(
  context, {
  required Color backColor,
  required IconData icon,
  required String title,
  required String subTitle,
  required Color contentColor,
  required Duration duration,
}) {
  return SnackBar(
    padding: EdgeInsets.zero,
    elevation: 0,
    duration: duration,
    backgroundColor: white,
    content: Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backColor,
      ),
      child: ListTile(
        trailing: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          },
          icon: Icon(
            Icons.clear,
            color: contentColor,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: contentColor,
          ),
        ),
        subtitle: Text(
          subTitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: contentColor,
          ),
        ),
        leading: Icon(
          icon,
          size: 20,
          color: contentColor,
        ),
      ),
    ),
  );
}
