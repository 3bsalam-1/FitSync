import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colors/colors.dart';

class TextFormSearch extends StatelessWidget {
  const TextFormSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: purple2,
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: gray4,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: gray4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: gray4,
          ),
        ),
        hintText: 'Search',
        prefixIcon: const Icon(
          Icons.search,
          color: gray4,
        ),
      ),
    );
  }
}
