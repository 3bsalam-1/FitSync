import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/colors.dart';

class CustomCardSwitch extends StatefulWidget {
  final IconData icon;
  final String title;
  final void Function()? process;

  const CustomCardSwitch({
    super.key,
    required this.title,
    required this.icon,
    this.process,
  });

  @override
  State<CustomCardSwitch> createState() => _CustomCardSwitchState();
}

class _CustomCardSwitchState extends State<CustomCardSwitch> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      margin: const EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: gray7,
          width: 0.6,
        ),
        boxShadow: [
          BoxShadow(
            color: gray7.withOpacity(0.6),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: purple4,
            size: 30,
          ),
          const SizedBox(width: 8),
          Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: gray4,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Switch(
            value: isSelected,
            activeTrackColor: purple4,
            activeColor: white,
            inactiveTrackColor: gray7,
            inactiveThumbColor: white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (value) {
              setState(() {
                isSelected = value;
              });
              // todo here add process to the function
              widget.process;
            },
          ),
        ],
      ),
    );
  }
}
