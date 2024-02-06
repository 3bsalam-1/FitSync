import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 20,
      ),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: gray7,
          width: 0.6,
        ),
        boxShadow: const [
          BoxShadow(
            color: gray7,
            blurRadius: 8,
          ),
        ],
        color: white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/profile.png',
                height: 60,
                width: 60,
              ),
            ),
          ),
          const SizedBox(width: 18),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Alex Hormozi',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: black,
                ),
              ),
              Text(
                'alexhormozi@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: gray4,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 25,
            color: purple2,
          ),
        ],
      ),
    );
  }
}
