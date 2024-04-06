import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../cubits_logic/splash_screen_next_cubit.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomAnimatedOpacity(
              child: SizedBox(
                width: double.maxFinite,
                height: height * 0.54,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      'assets/images/background_logo.png',
                      width: double.maxFinite,
                      height: height * 0.5,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                        width: 200,
                        height: height * 0.43,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomAnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              child: Image.asset(
                'assets/images/logo_name.png',
              ),
            ),
            CustomAnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  'Fuel Your Fitness Journey with',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: gray,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            const Spacer(),
            BlocListener<SplashScreenNextCubit, Widget>(
              listener: (context, state) {
                AnimatedNavigator().pushReplacementScale(
                  context,
                  state,
                );
              },
              child: CustomAnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                child: CustomButton(
                  label: 'Get Started',
                  onPressed: () {
                    context.read<SmartWatchCubit>().intializeSmartWatchConnection();
                    context.read<SmartWatchCubit>().getSmartWatchData();
                    context.read<SplashScreenNextCubit>().splashNextPage();
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}