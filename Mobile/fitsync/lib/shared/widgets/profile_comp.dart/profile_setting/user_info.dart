import 'package:fitsync/data/cubit/user_data/user_data_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../services/pref.dart';
import '../../../colors/colors.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataInfoCubit, UserDataInfoState>(
      builder: (context, state) {
        var data = context.read<UserDataInfoCubit>().userData;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            cardInfo(
              title: 'Username',
              data: data != null ? Prefs.getStringList('user')![0] : '_',
            ),
            const Divider(
              color: gray7,
              thickness: 1,
            ),
            cardInfo(
              title: 'Gender',
              data: data != null ? data.gender == 0? 'Male': 'Female': '_',
            ),
            const Divider(
              color: gray7,
              thickness: 1,
            ),
            cardInfo(
              title: 'Birth-Date',
              data: data != null? DateFormat('dd/MM/yyyy').format(data.birthdate): '_',
            ),
            const Divider(
              color: gray7,
              thickness: 1,
            ),
            cardInfo(
              title: 'Height',
              data: data != null? data.height.toString(): '_',
            ),
            const Divider(
              color: gray7,
              thickness: 1,
            ),
            cardInfo(
              title: 'Weight',
              data: data != null? data.weight.toString(): '_',
            ),
            const Divider(
              color: gray7,
              thickness: 1,
            ),
            cardInfo(
              title: 'Blood-sugar',
              data: data != null? data.bloodSugar.toString(): '_',
            ),
            const Divider(
              color: gray7,
              thickness: 1,
            ),
            cardInfo(
              title: 'Systolic-blood-pressure',
              data: data != null? data.systolicBP.toString(): '_',
            ),
            const Divider(
              color: gray7,
              thickness: 1,
            ),
            cardInfo(
              title: 'Diastolic-blood-pressure',
              data: data != null? data.diastolicBP.toString(): '_',
            ),
            const Divider(
              color: gray7,
              thickness: 1,
            ),
            cardInfo(
              title: 'Cholesterol-level',
              data: data != null? data.cholesterolLevel.toString(): '_',
            ),
            const Divider(
              color: gray7,
              thickness: 1,
            ),
            cardInfo(
              title: 'Knee-Pain',
              data: data != null? data.kneePain == 0? 'NO': 'YES': '_',
            ),
            const Divider(
              color: gray7,
              thickness: 1,
            ),
            cardInfo(
              title: 'Back-Pain',
              data: data != null? data.backPain == 0? 'NO': 'YES': '_',
            ),
          ],
        );
      },
    );
  }
}

Widget cardInfo({
  required String title,
  required String data,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: gray4,
          fontWeight: FontWeight.w600,
        ),
      ),
      const Spacer(),
      Text(
        data,
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
  );
}
