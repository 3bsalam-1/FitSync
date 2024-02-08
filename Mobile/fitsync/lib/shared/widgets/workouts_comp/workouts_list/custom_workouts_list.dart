import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';

import 'wourkouts_list_data.dart';

class CustomWorkoutsList extends StatelessWidget {
  const CustomWorkoutsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: white,
        boxShadow: [
          BoxShadow(
            color: gray4.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(
          thickness: 1.2,
          color: gray4,
        ),
        itemCount: workoutsListData.length,
        itemBuilder: (context, index) => Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 12),
            Image.asset(
              workoutsListData[index][0]!,
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Text(
              workoutsListData[index][1]!,
              style: const TextStyle(
                color: gray4,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                // todo got to the page
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: purple2,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
