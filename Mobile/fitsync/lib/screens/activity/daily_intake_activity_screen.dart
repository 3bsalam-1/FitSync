import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/global/navigation_page_cubit.dart';
import '../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/daily_intake_comp/draggable_scroll_intake.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_app_bar.dart';

class DailyIntakeActivityScreen extends StatelessWidget {
  const DailyIntakeActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Daily Intake', () {
        context.read<NavigationPageCubit>().changePage(3);
      }),
      backgroundColor: white,
      body: Column(
        children: [
          CustomAnimatedOpacity(
            child: BlocBuilder<SmartWatchCubit, SmartWatchState>(
              builder: (context, state) {
                final data = context.read<SmartWatchCubit>().smartWatchData;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Today you have',
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
                          'Consumed ',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${data == null ? "0" : (data.activeCalories * 1000).toStringAsFixed(2)} cal',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: purple5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const Expanded(
            child: DraggableScrollIntake(),
          ),
        ],
      ),
    );
  }
}
