import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/profile_comp.dart/grid_reminder_items.dart';
import '../../shared/widgets/profile_comp.dart/list_reminder_items.dart';

class ReminderMainScreen extends StatelessWidget {
  const ReminderMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: purple2,
            size: 37,
          ),
        ),
        actions: [
          // todo show imageProfile here
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/profile.png',
                height: 48,
                width: 48,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Text(
                DateFormat.yMMMMd().format(DateTime.now())+DateFormat.jm().format(DateTime.now()), //DateTime.now().toString(),
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
