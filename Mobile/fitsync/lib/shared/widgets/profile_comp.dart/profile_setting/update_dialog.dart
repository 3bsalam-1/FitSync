import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';
import '../../global/animated_navigator.dart';
import '../../global/custom_translate_text.dart';

class UpdateDialog extends StatelessWidget {
  final Widget content;

  const UpdateDialog({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: white,
            ),
            child: content,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: customTranslateText(
            'Save',
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: purple2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
          child: customTranslateText(
            'Cancel',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
