import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/workouts/filters_workouts_cubit.dart';
import '../../../../data/models/workouts_model.dart';
import '../../../colors/colors.dart';
import '../../global/custom_translate_text.dart';

class CustomFilterItem extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final List<String> selectedLabel;

  const CustomFilterItem({
    super.key,
    required this.onTap,
    required this.label,
    required this.selectedLabel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersWorkoutsCubit, List<WorkoutsModel>>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 15),
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: selectedLabel.contains(label) ? purple5 : gray13,
                borderRadius: BorderRadius.circular(25),
              ),
              child: customTranslateText(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 13.5,
                  color: selectedLabel.contains(label) ? white : gray4,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
