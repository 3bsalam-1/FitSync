import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits_logic/global/dark_mode_cubit.dart';
import '../../cubits_logic/global/notification_cubit.dart';
import '../../services/local_notification_services.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_translate_text.dart';
import '../../shared/widgets/profile_comp.dart/profile_main/custom_card_icon.dart';
import '../../shared/widgets/profile_comp.dart/profile_main/custom_card_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
//import '../../shared/widgets/global/custom_menu_button.dart';
import '../../shared/widgets/profile_comp.dart/profile_main/custom_show_dialog.dart';
import '../../shared/widgets/profile_comp.dart/profile_main/profile_card.dart';
import '../Login/forgot_password_screen.dart';
import 'reminder_main_screen.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocBuilder<DarkModeCubit, ThemeData>(
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
                        value:
                            state.brightness == Brightness.light ? false : true,
                        onChanged: (value) {
                          context.read<DarkModeCubit>().toggleTheme();
                        },
                      ),
                      const CustomCardIcon(
                        title: 'Privacy',
                        icon: Icons.lock_outline,
                      ),
                      CustomCardIcon(
                        title: 'Security',
                        icon: Icons.security_outlined,
                        onTap: () {
                          AnimatedNavigator().push(
                            context,
                            const ForgotPasswordPage(),
                          );
                        },
                      ),
                      CustomCardIcon(
                        title: 'Language',
                        icon: Icons.language,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const CustomShowLangDialog();
                            },
                          );
                        },
                      ),
                      BlocConsumer<NotificationCubit, NotificationState>(
                        listener: (context, state) {
                          if (state is NotificationDenied) {
                            state.showDialog(context);
                          }
                        },
                        builder: (context, state) {
                          return CustomCardSwitch(
                            title: 'Notifications',
                            icon: Icons.notifications_none,
                            value: context.read<NotificationCubit>().data,
                            onChanged: (value) {
                              // todo here testing heart attack testing
                              if (value) {
                                LocalNotificationServices.showAlarmNotification(
                                    40);
                              }
                              // todo /////////////////////////////////////////
                              context
                                  .read<NotificationCubit>()
                                  .initNotifications(value);
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      customTranslateText(
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
                            builder: (context) {
                              return const CustomShowLogoutDialog();
                            },
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
