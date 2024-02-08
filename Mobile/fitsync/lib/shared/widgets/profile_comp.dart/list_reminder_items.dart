import 'package:flutter/material.dart';
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Soon',
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
