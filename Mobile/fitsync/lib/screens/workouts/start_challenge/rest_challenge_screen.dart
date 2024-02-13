import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';
import '../../../shared/widgets/survey_comp/custom_icon_app_bar.dart';

class RestChallengeScreen extends StatelessWidget {
  const RestChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customIconAppBar(
        onPressed: () {
          AnimatedNavigator().pop(context);
        },
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Take Rest!',
              style: TextStyle(
                color: purple5,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1),
              duration: const Duration(seconds: 20),
              builder: (context, value, _) {
                int seconds = (value * 20).toInt();
                return Text(
                  '00:${seconds <= 9 ? '0$seconds' : seconds}',
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 22),
              child: Divider(
                color: gray7,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Next Movement(2/7)',
                style: TextStyle(
                  color: gray7,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Cow Pose',
                style: TextStyle(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/start_challenge.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const Spacer(),
            CustomButton(
              label: 'Skip Rest',
              onPressed: () {
                // todo Skip Rest
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
