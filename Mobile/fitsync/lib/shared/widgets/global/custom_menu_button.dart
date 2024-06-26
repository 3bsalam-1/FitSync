import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';
import '../global/custom_translate_text.dart';

class CustomMenuButton extends StatelessWidget {
  final List<String> labels;
  final Widget? child;
  final void Function(int)? onSelected;

  const CustomMenuButton({
    super.key,
    required this.labels,
    required this.onSelected,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: PopupMenuButton<int>(
        iconColor: purple2,
        color: white,
        surfaceTintColor: white,
        onSelected: onSelected,
        itemBuilder: (context) => List.generate(
          labels.length,
          (index) => PopupMenuItem(
            value: index,
            child: customTranslateText(
              labels[index],
              style: GoogleFonts.poppins(
                color: purple5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
