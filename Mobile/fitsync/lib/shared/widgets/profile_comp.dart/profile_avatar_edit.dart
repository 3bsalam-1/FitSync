import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/colors.dart';

class ProfileAvatarEdit extends StatelessWidget {
  const ProfileAvatarEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: white,
              child: Center(
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  // todo change the user avatar image select avatar from the galary
                },
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: purple2,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        // todo add the username here
        Text(
          'Alex Hormozi',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: white,
              size: 20,
            ),
            // todo show the city name location of the user
            Text(
              'New York',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: white,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
