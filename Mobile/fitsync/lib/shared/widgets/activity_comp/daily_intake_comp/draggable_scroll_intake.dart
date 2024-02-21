import '../../global/custom_animated_opacity.dart';
import 'package:flutter/material.dart';
import '../../../colors/colors.dart';
import '../custom_button_activity.dart';
import 'daily_info_item.dart';
import 'progress_daily_gools.dart';

class DraggableScrollIntake extends StatelessWidget {
  const DraggableScrollIntake({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.maxFinite,
      height: height * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
        boxShadow: [
          BoxShadow(
            color: gray4.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Container(
            height: 7,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: gray7.withOpacity(0.7),
            ),
          ),
          // todo here add wedgits
          const SizedBox(height: 30),
          const CustomAnimatedOpacity(
            child: ProgressDailyGools(progress: 40),
          ),
          const SizedBox(height: 50),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomAnimatedOpacity(
                child: DailyInfoItem(
                  label: 'Consumed',
                  value: '700',
                ),
              ),
              CustomAnimatedOpacity(
                child: DailyInfoItem(
                  label: 'Intake',
                  value: '1820',
                ),
              ),
              CustomAnimatedOpacity(
                child: DailyInfoItem(
                  label: 'Active Hours',
                  value: '5',
                  icon: Icons.timeline_rounded,
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomAnimatedOpacity(
            child: CustomButtonActivity(
              label: 'Add Meal',
              onPressed: () {
                // todo here add meal
              },
              icon: Icons.apple_rounded,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
