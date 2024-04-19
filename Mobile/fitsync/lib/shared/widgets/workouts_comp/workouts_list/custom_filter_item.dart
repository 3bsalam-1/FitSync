import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';

class CustomFilterItem extends StatefulWidget {
  final String label;
  const CustomFilterItem({super.key, required this.label});

  @override
  State<CustomFilterItem> createState() => _CustomFilterItemState();
}

class _CustomFilterItemState extends State<CustomFilterItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 15),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: isSelected ? purple5 : gray13,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(
              fontSize: 13.5,
              color: isSelected ? white : gray4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
