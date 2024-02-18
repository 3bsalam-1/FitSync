import 'package:flutter/material.dart';
import '../../../colors/colors.dart';
import '../../global/custom_animated_opacity.dart';

class ProgressDailyGools extends StatelessWidget {
  final double progress;

  const ProgressDailyGools({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 4),
        builder: (context, value, _) => Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 135,
              width: 135,
              child: CircularProgressIndicator(
                value: (value <= progress / 100) ? value : progress / 100,
                backgroundColor: gray3.withOpacity(0.1),
                color: purple2,
                strokeWidth: 16.0,
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    cyan,
                    purple7,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$progress%',
                    style: const TextStyle(
                      color: white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'of daily goals',
                    style: TextStyle(
                      color: white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
