import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';

class ClassWaterMeasure extends StatelessWidget {
  const ClassWaterMeasure({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // todo minus
              },
              icon: const CircleAvatar(
                radius: 20,
                backgroundColor: purple5,
                child: Divider(
                  color: white,
                  indent: 10,
                  endIndent: 10,
                  thickness: 3,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cyan2.withOpacity(0.1),
              ),
              child: Image.asset(
                'assets/images/glass.png',
                height: 34,
                width: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                // todo add
              },
              icon: const CircleAvatar(
                radius: 20,
                backgroundColor: purple5,
                child: Icon(
                  Icons.add,
                  color: white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Text(
          // todo show the number of glasses that was selected
          '1x Glass 200ml',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
