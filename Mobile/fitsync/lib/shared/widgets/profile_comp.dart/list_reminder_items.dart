import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';
import 'custom_item_reminder.dart';

class ListReminderItems extends StatelessWidget {
  const ListReminderItems({super.key});

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
              'Soon',
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
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) => const CustomItemReminder(),
            separatorBuilder: (context, index) => const SizedBox(width: 17),
          ),
        ),
      ],
    );
  }
}
