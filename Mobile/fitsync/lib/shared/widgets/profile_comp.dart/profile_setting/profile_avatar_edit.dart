import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../../../services/pref.dart';
import '../../../colors/colors.dart';
import '../../global/skeleton_container_loading.dart';

class ProfileAvatarEdit extends StatelessWidget {
  const ProfileAvatarEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataInfoCubit, UserDataInfoState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                context.read<UserDataInfoCubit>().userData != null
                ? CircleAvatar(
                  radius: 55,
                  backgroundColor: white,
                  child: Center(
                    child: Image.network(
                      Prefs.getStringList('user')![3],
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ) : const SkeletonContainerLoading(
                  height: 100,
                  width: 100,
                  shape: BoxShape.circle,
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
            context.read<UserDataInfoCubit>().userData != null
            ? Text(
              '${Prefs.getStringList('user')![1]} ${Prefs.getStringList('user')![2]}',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: white,
                fontWeight: FontWeight.w600,
              ),
            ): const SkeletonContainerLoading(
              height: 30,
              width: 70,
              shape: BoxShape.rectangle,
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
                context.read<UserDataInfoCubit>().userData != null
                ?Text(
                  'New York',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: white,
                    fontWeight: FontWeight.w500,
                  ),
                ): const SkeletonContainerLoading(
                  height: 30,
                  width: 70,
                  shape: BoxShape.rectangle,
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
