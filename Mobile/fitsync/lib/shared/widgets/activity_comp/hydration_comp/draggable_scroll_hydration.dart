import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits_logic/smart_watch/hydration_activity_cubit.dart';
import '../../../colors/colors.dart';
import '../../global/custom_animated_opacity.dart';
import '../custom_button_activity.dart';
import 'class_water_measure.dart';
import 'water_measure.dart';

class DraggableScrollHydration extends StatelessWidget {
  const DraggableScrollHydration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
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
        child: BlocBuilder<HydrationActivityCubit, HydrationActivityState>(
          builder: (context, state) {
            final provider = context.read<HydrationActivityCubit>();
            return Column(
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
                const SizedBox(height: 50),
                CustomAnimatedOpacity(
                  child: WaterMeasure(
                    progress: provider.progress,
                    waterTaked: provider.waterTaked,
                  ),
                ),
                const SizedBox(height: 50),
                CustomAnimatedOpacity(
                  child: ClassWaterMeasure(
                    onDecrement: () {
                      provider.minusGlass();
                    },
                    onIncreamet: () {
                      provider.addGlass();
                    },
                    label:
                        '${provider.glasses}x Glass ${provider.glasses * 200}ml',
                  ),
                ),
                const SizedBox(height: 20),
                CustomAnimatedOpacity(
                  child: CustomButtonActivity(
                    label: 'Add Drink',
                    onPressed: () {
                      provider.saveTekedGlasses();
                    },
                    icon: Icons.water_drop_rounded,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            );
          },
        ),
      ),
    );
  }
}
