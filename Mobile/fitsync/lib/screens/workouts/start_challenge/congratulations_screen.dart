import '../../workouts/workouts_screen.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/global/custom_button.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../shared/colors/colors.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(onPressed: () {
        AnimatedNavigator().pop(context);
      }),
      backgroundColor: white,
      body: Column(
        children: [
          Image.asset(
            'assets/images/prize.png',
            width: 230,
            height: 280,
            fit: BoxFit.fill,
          ),
          const Text(
            'Congratulations!',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w800,
              color: gold2,
            ),
          ),
          const Text(
            'You have completed the workout',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: black,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              congratulateData(title: 'workout', value: '10'),
              congratulateData(title: 'Cal', value: '340'),
              congratulateData(title: 'Minutes', value: '10:00'),
            ],
          ),
          const Spacer(),
          CustomButton(
            label: 'Next workout', 
            horizontalPadding: 30,
            onPressed: (){
            // todo go to the next workouts
          }),
          const SizedBox(height: 20),
          CustomButton(
            label: 'Workout', 
            horizontalPadding: 30,
            onPressed: (){
            AnimatedNavigator().pushAndRemoveUntil(
              context, 
              const WorkoutsScreen(),
            );
          }),
          const SizedBox(height: 37),
        ],
      ),
    );
  }
}

Widget congratulateData({
  required String title, 
  required String value,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        value,
        style: const TextStyle(
          color: black,
          fontSize: 35,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        title,
        style: const TextStyle(
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
