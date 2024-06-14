import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits_logic/global/navigation_page_cubit.dart';
import '../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../services/pref.dart';
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
      appBar: customAppBar(context, 'Sleep', () {
        context.read<NavigationPageCubit>().changePage(3);
      }),
      backgroundColor: white,
      body: BlocBuilder<SmartWatchCubit, SmartWatchState>(
        builder: (context, state) {
          final sleep = context.read<SmartWatchCubit>().smartWatchData?.sleep.toDouble();
          final goalSleep = Prefs.getDouble("sleep-goal");
          return Column(
            children: [
              CustomAnimatedOpacity(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    SleepHours(
                      title: 'Hours',
                      basic: '/${goalSleep?.toStringAsPrecision(3) ?? "0.00"}',
                      current: sleep?.toStringAsPrecision(3) ?? "0.00",
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
          );
        },
      ),
    );
  }
}
