import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/global/internet_connectivity_cubit.dart';
import '../../cubits_logic/global/new_token_cubit.dart';
import '../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/profile_comp.dart/profile_setting/profile_avatar_edit.dart';
import '../../shared/widgets/profile_comp.dart/profile_setting/profile_user_info.dart';

class ProfileInformationScreen extends StatelessWidget {
  const ProfileInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAnimatedOpacity(
          child: Text(
            'Profile',
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: true,
        leading: CustomAnimatedOpacity(
          child: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              Future.delayed(const Duration(seconds: 1), () {
                AnimatedNavigator().pop(context);
              });
            },
            icon: const Icon(
              Icons.arrow_circle_left,
              color: white,
              size: 37,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                purple,
                purple2,
                cyan,
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: white,
      body: MultiBlocListener(
        listeners: [
          BlocListener<InternetConnectivityCubit, InternetConnectivityState>(
            listener: (context, state) {
              if (state is InternetConnectivityOFFWithData ||
                  state is InternetConnectivityOFF) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(days: 1),
                    backgroundColor: gray10,
                    content: Text(
                      "There is no internet connection",
                    ),
                  ),
                );
              }
              if (state is InternetConnectivityON) {
                context.read<NewTokenCubit>().getNewToken();
              }
            },
          ),
          BlocListener<NewTokenCubit, bool>(
            listener: (context, state) {
              if (state) {
                context.read<UserDataInfoCubit>().getUserDataInfo(context);
              }
            },
          ),
        ],
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                purple,
                purple2,
                cyan,
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: BlocBuilder<UserDataInfoCubit, UserDataInfoState>(
            builder: (context, state) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ProfileAvatarEdit(),
                  ProfileUserInfo(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
