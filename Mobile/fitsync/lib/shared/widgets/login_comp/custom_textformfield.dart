import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class custom_TextFormField extends StatelessWidget {
  String hint_text;
  IconData icon_var;
  IconData? suffix_icon;
  custom_TextFormField({
    super.key,
    required this.icon_var,
    required this.hint_text,
    this.suffix_icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (0.87),
      height: MediaQuery.of(context).size.height * (0.07),
      child: TextFormField(
          decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 4),
          child: Icon(
            icon_var,
            color: gray4,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              suffix_icon,
              color: gray3,
            ),
          ),
        ),

        hintText: hint_text,
        hintStyle:
            GoogleFonts.poppins(color: gray3, fontWeight: FontWeight.w400, fontSize: 16),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: purple4, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: gray3, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        // border:
      )),
    );
  }
}
