import 'package:flutter/material.dart';

import '../../../colors/colors.dart';

class TextFormSearch extends StatelessWidget {
  const TextFormSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: purple2,
      style: const TextStyle(
        color: gray4,
        fontSize: 16,
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
