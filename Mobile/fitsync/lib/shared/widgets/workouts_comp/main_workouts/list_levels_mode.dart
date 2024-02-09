import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits_logic/workouts/selected_level_mode.dart';
import '../../../colors/colors.dart';

class ListLevelsMode extends StatelessWidget {
  const ListLevelsMode({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        itemCount: context.read<SelectedLevelMode>().level.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => BlocBuilder<SelectedLevelMode, int>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                // TODO here change cart when pressing the level mode
                context.read<SelectedLevelMode>().selectedLevel(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.symmetric(horizontal: 7),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: state == index ? purple5 : white,
                  border: Border.all(
                    width: 1.4,
                    color: state == index ? purple5 : gray4,
                  ),
                ),
                child: Center(
                  child: Text(
                    context.read<SelectedLevelMode>().level[index],
                    style: TextStyle(
                      fontSize: 14,
                      color: state == index ? white : gray4,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
