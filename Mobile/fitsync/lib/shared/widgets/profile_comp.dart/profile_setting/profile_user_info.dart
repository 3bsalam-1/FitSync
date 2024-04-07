import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../../colors/colors.dart';
import 'user_info.dart';
import 'user_square_info.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.read<UserDataInfoCubit>().userData;
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
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
            UserSquareInfo(data: data!),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.maxFinite,
              child: const UserInfo(),
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
