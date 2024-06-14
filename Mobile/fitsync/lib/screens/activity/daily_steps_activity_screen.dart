import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/global/navigation_page_cubit.dart';
import '../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../services/pref.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/daily_steps/draggable_scroll_daily_steps.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_app_bar.dart';

class DailyStepsActivityScreen extends StatelessWidget {
  const DailyStepsActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Daily Steps', () {
        context.read<NavigationPageCubit>().changePage(3);
      }),
      backgroundColor: white,
      body: BlocBuilder<SmartWatchCubit, SmartWatchState>(
        builder: (context, state) {
          final smartData = context.read<SmartWatchCubit>().smartWatchData;
          final goalSteps = Prefs.getDouble("distance-goal") ?? 1;
          return Column(
            children: [
              CustomAnimatedOpacity(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'You have walked',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${((smartData?.distanceKM ?? 0) / goalSteps).round() * 100}%',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: purple5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ' of your goal',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: DraggableScrollDailySteps(),
              ),
            ],
          );
        },
      ),
    );
  }
}
