import 'package:fitsync/shared/widgets/profile_comp.dart/custom_card_icon.dart';
import 'package:fitsync/shared/widgets/profile_comp.dart/custom_card_switch.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/profile_comp.dart/profile_card.dart';
import 'reminder_main_screen.dart';
import 'write_reminder_screen.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: black,
          ),
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerTheme: const DividerThemeData(
                color: white,
                indent: 10,
                endIndent: 10,
              ),
            ),
            child: PopupMenuButton<int>(
              iconColor: purple2,
              color: purple2,
              elevation: 2,
              onSelected: (value) {
                if (value == 0) {
                  AnimatedNavigator().push(
                    context,
                    const WriteReminderScreen(),
                  );
                } else {
                  AnimatedNavigator().push(
                    context,
                    const ReminderMainScreen(),
                  );
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Add reminder',
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    'My reminders',
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileCard(),
              SizedBox(height: 15),
              Text(
                'Settings & Preferences',
                style: TextStyle(
                  fontSize: 16,
                  color: black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 22),
              CustomCardSwitch(
                title: 'Dark Mode',
                icon: Icons.dark_mode_outlined,
              ),
              CustomCardIcon(
                title: 'Privacy',
                icon: Icons.lock_outline,
              ),
              CustomCardIcon(
                title: 'Security',
                icon: Icons.security_outlined,
              ),
              CustomCardIcon(
                title: 'Language',
                icon: Icons.language,
              ),
              CustomCardSwitch(
                title: 'Notifications',
                icon: Icons.notifications_none,
              ),
              SizedBox(height: 15),
              Text(
                'Support',
                style: TextStyle(
                  fontSize: 16,
                  color: black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 22),
              CustomCardIcon(
                title: 'FAQ',
                icon: Icons.abc,
              ),
              CustomCardIcon(
                title: 'Help & Support',
                icon: Icons.question_mark_outlined,
              ),
              CustomCardIcon(
                title: 'Logout',
                icon: Icons.logout_sharp,
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
