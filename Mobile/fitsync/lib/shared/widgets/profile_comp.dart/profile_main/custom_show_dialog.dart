import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../cubits_logic/global/translate_lang_cubit.dart';
import '../../../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../../../screens/splash/start_screen.dart';
import '../../../colors/colors.dart';
import '../../global/animated_navigator.dart';
import '../../global/custom_translate_text.dart';

class CustomShowLogoutDialog extends StatelessWidget {
  const CustomShowLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
            customTranslateText(
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
                    context.read<UserDataInfoCubit>().userLogout();
                    AnimatedNavigator().pushAndRemoveUntil(
                      context,
                      const StartScreen(),
                    );
                  },
                  child: customTranslateText(
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
                  child: customTranslateText(
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
    );
  }
}

class CustomShowLangDialog extends StatelessWidget {
  const CustomShowLangDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: white,
        ),
        child: BlocBuilder<TranslatelangCubit, String>(
          builder: (context, state) {
            final provider = context.read<TranslatelangCubit>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    provider.setLanguage('en');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'English',
                    style: GoogleFonts.poppins(
                      color: state == 'en' ? purple2 : black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Divider(),
                TextButton(
                  onPressed: () {
                    provider.setLanguage('ar');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'العربية',
                    style: GoogleFonts.poppins(
                      color: state == 'ar' ? purple2 : black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
