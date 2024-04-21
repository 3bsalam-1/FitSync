import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIngredientsWidget extends StatelessWidget {
  final String imageUrl;
  final String label1;
  final String label2;
  const CustomIngredientsWidget({
    super.key,
    required this.imageUrl,
    required this.label1,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * (80 / 428),
            height: MediaQuery.of(context).size.height * (80 / 926),
            decoration: BoxDecoration(
              color: gray19,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              children: [
                SizedBox(
                  width: 69,
                  child: Text(
                    label1,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: black2,
                    ),
                   maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              label2,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: gray4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
