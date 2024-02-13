import 'package:flutter/material.dart';
import '../../../../screens/workouts/workouts_view_challenge.dart';
import '../../../colors/colors.dart';
import '../../global/animated_navigator.dart';
import 'custom_start_button.dart';

class WorkOutsChallengCard extends StatelessWidget {
  const WorkOutsChallengCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Challenges',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: black,
              ),
            ),
            TextButton(
              onPressed: () {
                // ToDo show all the challenges
              },
              child: const Text(
                'View all',
                style: TextStyle(
                  color: purple2,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: black,
          ),
          width: width,
          height: 205,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/workouts.png',
                  height: 200,
                  width: width * 0.42,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      '7 x 4 CHALLENGE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.42,
                    child: const Text(
                      'FULL BODY Stretching',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomStartButton(
                    onTap: () {
                      // TODO start the challenge workouts
                      AnimatedNavigator().push(
                        context,
                        const WorkoutsViewChallenge(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
