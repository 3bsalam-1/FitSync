import 'package:google_fonts/google_fonts.dart';

import '../../../shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../workouts_screen.dart';

class EmptySavedWorkoutsScreen extends StatelessWidget {
  const EmptySavedWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text('Saved Workout'),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 22,
          color: black,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: purple3,
            size: 40,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 7,
              right: 12,
            ),
            child: CircleAvatar(
              radius: 20,
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: Column(
        children: [
          Image.asset(
            'assets/images/lock.png',
            width: 370,
            height: 328,
            fit: BoxFit.fill,
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: Text(
              'Your Saved Workout is empty you can discover latest workout now',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: gray6,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 50),
          CustomButton(
            label: 'Workout',
            onPressed: () {
              AnimatedNavigator().pushAndRemoveUntil(
                context,
                const WorkoutsScreen(),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
