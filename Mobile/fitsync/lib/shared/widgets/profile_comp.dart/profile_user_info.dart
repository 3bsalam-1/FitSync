import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../colors/colors.dart';
import 'profile_setting_info.dart';
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
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        child: BlocBuilder<UserDataInfoCubit, UserDataInfoState>(
          builder: (context, state) {
            var data = context.read<UserDataInfoCubit>().userData;
            var userData = userInfoData(
              context,
              data,
            );
            return Column(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareInfo(
                      title: 'Height',
                      value: '${data?.height ?? '_'}cm',
                    ),
                    const SizedBox(width: 10),
                    SquareInfo(
                      title: 'Weight',
                      value: '${data?.weight ?? '_'}kg',
                    ),
                    const SizedBox(width: 10),
                    SquareInfo(
                      title: 'Age',
                      value:
                          '${data == null ? '_' : DateTime.now().year - data.birthdate.year}yo',
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.maxFinite,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: userData.length,
                    itemBuilder: (context, index) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          userData[index][0] ?? '_',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: gray4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          userData[index][1]!,
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
            );
          },
        ),
      ),
    );
  }
}
