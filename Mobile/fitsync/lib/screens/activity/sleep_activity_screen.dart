import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits_logic/navigation_page_cubit.dart';
import '../../shared/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/activity_comp/sleep_comp/draggable_scroll_sleep.dart';
import '../../shared/widgets/activity_comp/sleep_comp/sleep_hours.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_app_bar.dart';

class SleepActivityScreen extends StatelessWidget {
  const SleepActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context, 
        'Sleep',
        () {
          context.read<NavigationPageCubit>().changePage(3);
        }
      ),
      backgroundColor: white,
      body: Column(
        children: [
          CustomAnimatedOpacity(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                const SleepHours(
                  title: 'Hours',
                  basic: ' /8.00',
                  current: '7.40',
                ),
                Image.asset(
                  'assets/images/Icons/night.png',
                  height: 30,
                  width: 30,
                ),
              ],
            ),
          ),
          const Expanded(
            child: DraggableScrollSleep(),
          ),
        ],
      ),
    );
  }
}
