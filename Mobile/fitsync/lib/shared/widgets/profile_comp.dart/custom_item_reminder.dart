import '../../colors/colors.dart';
import 'package:flutter/material.dart';

class CustomItemReminder extends StatelessWidget {
  const CustomItemReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: black,
        image: const DecorationImage(
          opacity: 0.6,
          fit: BoxFit.fill,
          image: AssetImage('assets/images/yoga.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Cardio',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
              ),
              InkWell(
                onTap: () {
                  // todo delete the item when clicked here
                },
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.5,
                      color: white,
                    ),
                  ),
                  child: const Icon(
                    Icons.delete_outline_outlined,
                    color: white,
                    size: 17,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 90,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Text(
              'Time to cardio exercise',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: gold,
              ),
            ),
          ),
          Container(
            width: 70,
            padding: const EdgeInsets.symmetric(
              vertical: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: white,
            ),
            child: const Text(
              'Today , 4:50',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 7,
                fontWeight: FontWeight.w700,
                color: black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
