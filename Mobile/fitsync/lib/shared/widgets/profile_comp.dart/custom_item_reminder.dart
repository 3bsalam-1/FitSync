import 'package:google_fonts/google_fonts.dart';

import '../../colors/colors.dart';
import 'package:flutter/material.dart';

class CustomItemReminder extends StatelessWidget {
  const CustomItemReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox( 
      child: Container(
        width: 160,
        height: 140,
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: black,
          image: const DecorationImage(
            opacity: 0.6,
            fit: BoxFit.fill,
            image: AssetImage('assets/images/yoga.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cardio',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // todo delete the item when clicked here
                  },
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: white,
                      ),
                    ),
                    child: const Icon(
                      Icons.delete_outline_outlined,
                      color: white,
                      size: 17,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 90,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Time to cardio exercise',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: gold,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 70,
              padding: const EdgeInsets.symmetric(
                vertical: 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: white,
              ),
              child: Text(
                'Today , 4:50',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 7,
                  color: black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
