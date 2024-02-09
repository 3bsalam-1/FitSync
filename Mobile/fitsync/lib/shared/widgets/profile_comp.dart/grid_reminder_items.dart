import 'package:flutter/material.dart';
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: gray3,
              ),
            ),
            Text(
              'View All',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: purple5,
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
