import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../screens/profile/profile_informtion_screen.dart';
import '../../../services/pref.dart';
import '../../colors/colors.dart';
import '../global/animated_navigator.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AnimatedNavigator().push(
          context,
          const ProfileInformationScreen(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 20,
        ),
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: gray7,
            width: 0.6,
          ),
          boxShadow: [
            BoxShadow(
              color: gray7.withOpacity(0.2),
              blurRadius: 8,
            ),
          ],
          color: white,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  Prefs.getStringList('user')![3],
                  height: 60,
                  width: 60,
                ),
              ),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${Prefs.getStringList('user')![1]} ${Prefs.getStringList('user')![2]}',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  Prefs.getString('email')!,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: gray4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: purple2,
            ),
          ],
        ),
      ),
    );
  }
}
