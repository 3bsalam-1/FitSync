import 'package:flutter/material.dart';
import '../../../colors/colors.dart';

class CircleProgressInfo extends StatelessWidget {
  final double progress;
  final IconData icon;
  final Color color;
  final String title;

  const CircleProgressInfo({
    super.key,
    required this.progress,
    required this.icon,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1),
          duration: const Duration(seconds: 5),
          builder: (context, value, _) => Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 45,
                width: 45,
                child: CircularProgressIndicator(
                  value: (value <= progress / 100) ? value : progress / 100,
                  backgroundColor: gray3.withOpacity(0.1),
                  color: color,
                  strokeWidth: 5.0,
                  strokeCap: StrokeCap.round,
                ),
              ),
              Icon(
                icon,
                color: color,
                size: 25,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
