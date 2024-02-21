import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';
import 'custom_item_reminder.dart';

class GridReminderItems extends StatelessWidget {
  const GridReminderItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: gray3,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'View All',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: purple5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 17,
              mainAxisSpacing: 17,
              childAspectRatio: 3 / 2,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) => const CustomItemReminder(),
          ),
        ),
      ],
    );
  }
}
