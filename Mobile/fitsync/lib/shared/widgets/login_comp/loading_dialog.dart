import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 120,
              width: 120,
              child: CircularProgressIndicator(
                color: green2,
                backgroundColor: gray5,
                strokeWidth: 12,
                strokeCap: StrokeCap.round,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'In Progress',
              style: GoogleFonts.poppins(
                color: green2,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}