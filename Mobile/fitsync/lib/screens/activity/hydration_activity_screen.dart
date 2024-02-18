import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/hydration_comp/draggable_scroll_hydration.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_app_bar.dart';

class HydrationActivityScreen extends StatelessWidget {
  const HydrationActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Hydration'),
      backgroundColor: white,
      body: SizedBox(
        height: double.maxFinite,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              child: CustomAnimatedOpacity(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Today you took ',
                      style: TextStyle(
                        color: black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // todo here add value of the
                        const Text(
                          '750 ml',
                          style: TextStyle(
                            color: purple5,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          ' of water',
                          style: TextStyle(
                            color: black,
                            fontSize: 24,
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
                    const Text(
                      'Almost there!  Keep Hydrated',
                      style: TextStyle(
                        color: gray4,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const DraggableScrollHydration(),
          ],
        ),
      ),
    );
  }
}
