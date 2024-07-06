import 'package:fitsync/data/cubit/user_data/user_data_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';
import 'data_info.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataInfoCubit, UserDataInfoState>(
      builder: (context, state) {
        var data = context.read<UserDataInfoCubit>().userData;
        List<DataInfo> infoData = getDataInfo(data);
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const Divider(
            color: gray7,
            thickness: 1,
          ),
          itemCount: infoData.length,
          itemBuilder: (_, index) => cardInfo(
            title: infoData[index].label,
            data: infoData[index].value,
          ),
        );
      },
    );
  }
}

Widget cardInfo({
  required String title,
  required String data,
  void Function()? onPressed,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: gray4,
          fontWeight: FontWeight.w500,
        ),
      ),
      const Spacer(),
      InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: gray4,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 5),
            // const Icon(
            //   Icons.arrow_forward_ios,
            //   size: 15,
            //   color: purple2,
            // ),
          ],
        ),
      ),
    ],
  );
}
