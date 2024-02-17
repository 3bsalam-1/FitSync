import 'package:flutter/material.dart';
import '../../../colors/colors.dart';
import '../custom_button_activity.dart';
import 'class_water_measure.dart';
import 'water_measure.dart';

class DraggableScrollHydration extends StatelessWidget {
  const DraggableScrollHydration({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: height * 0.7),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, _) => AnimatedContainer(
        curve: Curves.bounceOut,
        duration: const Duration(milliseconds: 600),
        width: double.maxFinite,
        height: value,
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
        child: SingleChildScrollView(
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
              const SizedBox(height: 50),
              const WaterMeasure(
                progress: 65,
              ),
              const SizedBox(height: 50),
              const ClassWaterMeasure(),
              const SizedBox(height: 20),
              CustomButtonActivity(
                label: 'Add Drink',
                onPressed: () {
                  // todo here add drink
                },
                icon: Icons.water_drop_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
