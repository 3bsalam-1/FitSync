import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../../../screens/profile/profile_informtion_screen.dart';
import '../../../../services/pref.dart';
import '../../../colors/colors.dart';
import '../../global/animated_navigator.dart';
import '../../global/custom_image.dart';

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
        child: BlocBuilder<UserDataInfoCubit, UserDataInfoState>(
          builder: (context, state) {
            return Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CustomImage(
                      imageUrl: Prefs.getStringList('user')![3],
                      height: 60,
                      width: 60,
                      fit: BoxFit.fill,
                      errorColor: red,
                      iconSize: 40,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 170,
                      child: Text(
                        Prefs.getString('email')!,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: gray4,
                          fontWeight: FontWeight.w600,
                        ),
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
            );
          },
        ),
      ),
    );
  }
}
