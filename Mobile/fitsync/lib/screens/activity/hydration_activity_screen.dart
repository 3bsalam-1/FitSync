import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/global/navigation_page_cubit.dart';
import '../../cubits_logic/smart_watch/hydration_activity_cubit.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/hydration_comp/draggable_scroll_hydration.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_app_bar.dart';

class HydrationActivityScreen extends StatelessWidget {
  const HydrationActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Hydration', () {
        context.read<NavigationPageCubit>().changePage(3);
      }),
      backgroundColor: white,
      body: Column(
        children: [
          CustomAnimatedOpacity(
            child: BlocBuilder<HydrationActivityCubit, HydrationActivityState>(
              builder: (context, state) {
                final provider = context.read<HydrationActivityCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Today you took ',
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
                          '${provider.waterTaked / 1000} L',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: purple5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ' of water',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Image.asset(
                          'assets/images/water.png',
                          height: 28,
                          width: 28,
                        ),
                      ],
                    ),
                    Text(
                      provider.waterTaked == 0
                          ? 'Bad Hydrated  take more water'
                          : 'Almost there!  Keep Hydrated',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: gray4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const Expanded(
            child: DraggableScrollHydration(),
          ),
        ],
      ),
    );
  }
}
