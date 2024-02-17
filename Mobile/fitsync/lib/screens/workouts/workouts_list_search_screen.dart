import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/workouts_comp/workouts_list/custom_workouts_list.dart';
import '../../shared/widgets/workouts_comp/workouts_list/text_form_search.dart';
import 'filters_workouts_screen.dart';

class WorkoutsListSearchScreen extends StatelessWidget {
  const WorkoutsListSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: white,
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
            FocusManager.instance.primaryFocus?.unfocus();
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
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                AnimatedNavigator().push(
                  context,
                  const FiltersWorkoutsScreen(),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      spreadRadius: 1,
                      color: gray4.withOpacity(0.08),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/Icons/filter_icon.png',
                  height: 25,
                  width: 25,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: white,
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
