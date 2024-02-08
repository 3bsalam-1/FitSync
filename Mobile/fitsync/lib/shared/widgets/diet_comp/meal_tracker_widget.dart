import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';

class MealTrackerWidget extends StatelessWidget {
  final String imageUrl;
  final String label1;
  final String label2;
  final String label3;
  final double size;
  MealTrackerWidget({
    required this.imageUrl,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 28,
            height: 28,
          ),
          Text(
            label1,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: black,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          RichText(
            text: TextSpan(
              text: label2,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: size,
                color: black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: label3,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: gray11)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
