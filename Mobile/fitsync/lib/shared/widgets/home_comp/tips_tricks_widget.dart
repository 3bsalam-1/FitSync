import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import '../global/custom_translate_text.dart';

class TipsAndTricksWidget extends StatelessWidget {
  final String imageUrl;
  final String label1;
  final String label2;
  final String label3;
  final String label4;
  final String label5;
  final String? label6;
  final String? label7;
  const TipsAndTricksWidget({
    required this.imageUrl,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4,
    required this.label5,
    this.label6,
    this.label7,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * (387 / 428),
          height: MediaQuery.of(context).size.height * (203 / 926),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: gray3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              color: black.withOpacity(0.2),
              colorBlendMode: BlendMode.darken,
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            padding: EdgeInsets.only(left: 6, right: 6),
            // width: MediaQuery.of(context).size.width * (48 / 428),
            height: MediaQuery.of(context).size.height * (22 / 926),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: white),
            child: Center(
              child: Text(
                label1,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: purple5,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: label2,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: white,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: label3,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: yellow)),
                    TextSpan(
                        text: label6,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: white)),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(
                    text: label4,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: label7,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: yellow)),
                    ]),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Row(
            children: [
              Icon(
                IconlyBold.time_circle,
                size: 20,
                color: white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                label5,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
