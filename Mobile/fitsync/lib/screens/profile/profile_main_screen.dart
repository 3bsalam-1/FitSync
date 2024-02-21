import 'package:fitsync/shared/widgets/profile_comp.dart/custom_card_icon.dart';
import 'package:fitsync/shared/widgets/profile_comp.dart/custom_card_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/custom_menu_button.dart';
import '../../shared/widgets/profile_comp.dart/profile_card.dart';
import 'reminder_main_screen.dart';
import 'write_reminder_screen.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: white,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
        ),
        actions: const [
          CustomMenuButton(
            labels: ['Add reminder', 'My reminders'],
            screens: [WriteReminderScreen(), ReminderMainScreen()],
          ),
        ],
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileCard(),
              const SizedBox(height: 15),
              Text(
                'Settings & Preferences',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 22),
              const CustomCardSwitch(
                title: 'Dark Mode',
                icon: Icons.dark_mode_outlined,
              ),
              const CustomCardIcon(
                title: 'Privacy',
                icon: Icons.lock_outline,
              ),
              const CustomCardIcon(
                title: 'Security',
                icon: Icons.security_outlined,
              ),
              const CustomCardIcon(
                title: 'Language',
                icon: Icons.language,
              ),
              const CustomCardSwitch(
                title: 'Notifications',
                icon: Icons.notifications_none,
              ),
              const SizedBox(height: 15),
              Text(
                'Support',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 22),
              const CustomCardIcon(
                title: 'FAQ',
                icon: Icons.abc,
              ),
              const CustomCardIcon(
                title: 'Help & Support',
                icon: Icons.question_mark_outlined,
              ),
              const CustomCardIcon(
                title: 'Logout',
                icon: Icons.logout_sharp,
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
