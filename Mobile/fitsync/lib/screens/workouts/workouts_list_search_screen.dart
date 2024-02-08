import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/workouts_comp/workouts_list/custom_workouts_list.dart';
import '../../shared/widgets/workouts_comp/workouts_list/text_form_search.dart';

class WorkoutsListSearchScreen extends StatelessWidget {
  const WorkoutsListSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Workout List',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: black,
          ),
        ),
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
        actions: [
          IconButton(
            onPressed: () {
              // todo navigate to the filter screen
            },
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: purple2,
              size: 37,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormSearch(),
              SizedBox(height: 40),
              CustomWorkoutsList(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
