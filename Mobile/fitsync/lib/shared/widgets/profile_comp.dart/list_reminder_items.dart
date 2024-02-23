import 'package:flutter/material.dart';
import 'custom_item_reminder.dart';

class ListReminderItems extends StatelessWidget {
  const ListReminderItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            shrinkWrap: true,
            itemBuilder: (context, index) => const CustomItemReminder(),
            separatorBuilder: (context, index) => const SizedBox(width: 17),
          ),
        ),
      ],
    );
  }
}
