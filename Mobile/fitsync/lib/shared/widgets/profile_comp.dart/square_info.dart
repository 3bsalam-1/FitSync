import 'package:flutter/material.dart';
import '../../colors/colors.dart';

class SquareInfo extends StatelessWidget {
  final String value;
  final String title;

  const SquareInfo({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: white,
        boxShadow: [
          BoxShadow(
            color: gray7.withOpacity(0.4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: black,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: gray4,
            ),
          ),
        ],
      ),
    );
  }
}
