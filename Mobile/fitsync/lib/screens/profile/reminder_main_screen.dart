import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/custom_app_bar.dart';
import '../../shared/widgets/profile_comp.dart/grid_reminder_items.dart';
import '../../shared/widgets/profile_comp.dart/list_reminder_items.dart';

class ReminderMainScreen extends StatelessWidget {
  const ReminderMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Reminders'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Text(
                '${DateFormat.yMMMMd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}', //DateTime.now().toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),
              const ListReminderItems(),
              const SizedBox(height: 20),
              const GridReminderItems(),
            ],
          ),
        ),
      ),
    );
  }
}
