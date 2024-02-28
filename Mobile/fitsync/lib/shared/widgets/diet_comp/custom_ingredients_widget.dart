import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomIngredientsWidget extends StatelessWidget {
  final String imageUrl;
  final String label1;
  final String label2;
  const CustomIngredientsWidget({
    super.key,
    required this.imageUrl,
    required this.label1,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * (80 / 428),
            height: MediaQuery.of(context).size.height * (80 / 926),
            decoration: BoxDecoration(
              color: gray15,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              label1,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: black2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              label2,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: gray4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
