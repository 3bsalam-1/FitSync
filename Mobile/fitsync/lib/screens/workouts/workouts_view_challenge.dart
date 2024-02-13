import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/workouts_comp/workouts_challenges/workouts_challenges_time.dart';
import '../../shared/widgets/workouts_comp/workouts_challenges/workouts_list_challenges.dart';

class WorkoutsViewChallenge extends StatelessWidget {
  const WorkoutsViewChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: width,
              height: height * 0.4,
              decoration: const BoxDecoration(
                color: black,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  opacity: 0.6,
                  image: AssetImage('assets/images/fullBody.png'),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 15,
              child: IconButton(
                onPressed: () {
                  AnimatedNavigator().pop(context);
                },
                icon: Container(
                  width: 37,
                  height: 37,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: purple2,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.65,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  ),
                  color: white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Full Body',
                          style: TextStyle(
                            color: black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            // todo add to the saved workouts
                          }, icon: const Icon(
                            Icons.favorite,
                            color: purple5,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),
                    const WorkoutsChallengesTime(),
                    const SizedBox(height: 9),
                    const WorkoutsListChallenges(),
                    const Spacer(),
                    CustomButton(
                      label: 'Start',
                      horizontalPadding: width*0.14,
                      onPressed: (){
                        // todo go to the start challenge screen
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
