import 'package:google_fonts/google_fonts.dart';

import '../../shared/widgets/workouts_comp/workouts_list/custom_filter_item.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';

class FiltersWorkoutsScreen extends StatelessWidget {
  const FiltersWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: purple2,
            size: 37,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Filter',
          style: GoogleFonts.poppins(
            fontSize: 22,
            color: black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: white,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: gray4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Category'),
              SizedBox(height: 12),
              Row(
                children: [
                  CustomFilterItem(label: 'Abs & Core'),
                  CustomFilterItem(label: 'Upper Body'),
                  CustomFilterItem(label: 'Lower Body'),
                ],
              ),
              Row(
                children: [
                  CustomFilterItem(label: 'Cardio'),
                  CustomFilterItem(label: 'Stretching'),
                ],
              ),
              Text('Fitness Tool'),
              SizedBox(height: 12),
              CustomFilterItem(label: 'Bodyweight'),
              SizedBox(height: 12),
              Text('Stance'),
              SizedBox(height: 12),
              Row(
                children: [
                  CustomFilterItem(label: 'Standing'),
                  CustomFilterItem(label: 'On the floor'),
                ],
              ),
              SizedBox(height: 12),
              Text('Difficulty'),
              SizedBox(height: 12),
              Row(
                children: [
                  CustomFilterItem(label: 'Easy'),
                  CustomFilterItem(label: 'Medium'),
                  CustomFilterItem(label: 'Hard'),
                ],
              ),
              SizedBox(height: 12),
              Text('Impact Level'),
              SizedBox(height: 12),
              Row(
                children: [
                  CustomFilterItem(label: 'Beginner'),
                  CustomFilterItem(label: 'Intermediate'),
                  CustomFilterItem(label: 'Advanced'),
                ],
              ),
              SizedBox(height: 12),
              Text('Noise Level'),
              SizedBox(height: 12),
              CustomFilterItem(label: 'Quiet'),
            ],
          ),
        ),
      ),
    );
  }
}
