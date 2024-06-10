import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits_logic/global/dark_mode_cubit.dart';
import '../../cubits_logic/global/navigation_page_cubit.dart';
import '../../services/pref.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/profile_comp.dart/profile_main/custom_card_icon.dart';
import '../../shared/widgets/profile_comp.dart/profile_main/custom_card_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
//import '../../shared/widgets/global/custom_menu_button.dart';
import '../../shared/widgets/profile_comp.dart/profile_main/profile_card.dart';
import '../splash/start_screen.dart';
import 'reminder_main_screen.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocBuilder<DarkModeCubit, bool>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              backgroundColor: white,
              title: CustomAnimatedOpacity(
                child: Text(
                  'Profile',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              actions: [
                CustomAnimatedOpacity(
                  child: IconButton(
                    onPressed: () {
                      AnimatedNavigator().push(
                        context,
                        const ReminderMainScreen(),
                      );
                    },
                    icon: const Icon(
                      Icons.more_vert,
                      color: purple2,
                    ),
                  ),
                ),
                // CustomMenuButton(
                //   labels: const ['My reminders'],
                //   onSelected: (pageIndex) {
                //     AnimatedNavigator().push(
                //       context,
                //       const ReminderMainScreen(),
                //     );
                //   },
                // ),
              ],
            ),
            backgroundColor: white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: CustomAnimatedOpacity(
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
                      CustomCardSwitch(
                        title: 'Dark Mode',
                        icon: Icons.dark_mode_outlined,
                        process: () {
                          context.read<DarkModeCubit>().cahngeMode(!state);
                        },
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
                                            Prefs.remove('user');
                                            Prefs.remove('watch-permission');
                                            context
                                                .read<NavigationPageCubit>()
                                                .changePage(0);
                                            AnimatedNavigator()
                                                .pushAndRemoveUntil(
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
            ),
          );
        },
      ),
    );
  }
}
