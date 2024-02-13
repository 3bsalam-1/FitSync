import '../../../../shared/colors/colors.dart';
import 'package:flutter/material.dart';

class WorkoutsListChallenges extends StatelessWidget {
  const WorkoutsListChallenges({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.36,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: gray3,
              width: 1,
            ),
            color: white,
            boxShadow: [
              BoxShadow(
                color: gray4.withOpacity(0.2),
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/pullup.png',
                fit: BoxFit.fill,
                width: 79,
                height: 77,
              ),
              const SizedBox(width: 20),
              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reclining to big toe',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: black,
                    ),
                  ),
                  Text(
                    '00:30',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: gray4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
