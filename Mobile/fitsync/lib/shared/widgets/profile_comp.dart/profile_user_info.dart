import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';
import 'square_info.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 7,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: gray7.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareInfo(
                  title: 'Height',
                  // todo showe the user height here
                  value: '180cm',
                ),
                SizedBox(width: 10),
                SquareInfo(
                  title: 'Weight',
                  // todo showe the user weight here
                  value: '60kg',
                ),
                SizedBox(width: 10),
                SquareInfo(
                  title: 'Age',
                  // todo showe the user age here
                  value: '22yo',
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.maxFinite,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      userInfo[index][0]!,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: gray4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      userInfo[index][1]!,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: gray4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: purple2,
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => const Divider(
                  color: gray7,
                  thickness: 1,
                ),
                itemCount: userInfo.length,
              ),
            ),
            const Spacer(flex: 2),
            TextButton(
              onPressed: () {
                // todo here delete the user account
              },
              child: Text(
                'Delete Account',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: red2,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  decorationColor: red2,
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

List<Map<int, String>> userInfo = [
  {
    0: 'Username',
    1: 'Alex',
  },
  {
    0: 'Gender',
    1: 'Male',
  },
  {
    0: 'Birth-Date',
    1: '20/06/2001',
  },
  {
    0: 'Height',
    1: '170 cm',
  },
  {
    0: 'Weight',
    1: '65kg',
  },
  {
    0: 'Blood-sugar',
    1: '45 Mg/dL',
  },
  {
    0: 'Systolic-blood-pressure',
    1: '40 SYS',
  },
  {
    0: 'Diastolic-blood-pressure',
    1: '35 DIA',
  },
  {
    0: 'Cholesterol-level',
    1: '35 Mg/dL',
  },
  {
    0: 'Knee-Pain',
    1: 'Quite-Pain',
  },
  {
    0: 'Back-Pain',
    1: 'Mild-Pain',
  },
];
