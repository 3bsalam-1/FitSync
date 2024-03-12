import '../../services/pref.dart';
import '../../shared/widgets/profile_comp.dart/custom_card_icon.dart';
import '../../shared/widgets/profile_comp.dart/custom_card_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_menu_button.dart';
import '../../shared/widgets/profile_comp.dart/profile_card.dart';
import '../splash/start_screen.dart';
import 'reminder_main_screen.dart';

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
        actions: [
          CustomMenuButton(
            labels: const ['My reminders'],
            onSelected: (pageIndex) {
              AnimatedNavigator().push(
                context,
                const ReminderMainScreen(),
              );
            },
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
              CustomCardIcon(
                title: 'Logout',
                icon: Icons.logout_sharp,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 22,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Are you sure that you want to logout?',
                              style: GoogleFonts.poppins(
                                color: black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Prefs.setBool('isLogin', false);
                                    AnimatedNavigator().pushAndRemoveUntil(
                                      context,
                                      const StartScreen(),
                                    );
                                  },
                                  child: Text(
                                    'Logout',
                                    style: GoogleFonts.poppins(
                                      color: purple5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: GoogleFonts.poppins(
                                      color: black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
