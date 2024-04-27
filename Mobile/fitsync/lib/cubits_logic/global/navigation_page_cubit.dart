import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screens/Diet/diet_screen.dart';
import '../../screens/Home/home_screen.dart';
import '../../screens/activity/activity_main_screen.dart';
import '../../screens/activity/daily_intake_activity_screen.dart';
import '../../screens/activity/daily_steps_activity_screen.dart';
import '../../screens/activity/hydration_activity_screen.dart';
import '../../screens/activity/sleep_activity_screen.dart';
import '../../screens/profile/profile_main_screen.dart';
import '../../screens/workouts/saved_workout/saved_workouts_main.dart';
import '../../screens/workouts/workouts_screen.dart';

class NavigationPageCubit extends Cubit<Widget> {
  NavigationPageCubit() : super(const HomePage());
  int isSelected = 0;

  final List<Widget> _pages = [
    const HomePage(),//0
    const WorkoutsScreen(),//1
    DietScreen(),//2
    const ActivityMainScreen(),//3
    const ProfileMainScreen(),//4
    const SleepActivityScreen(),//5
    const DailyStepsActivityScreen(),//6
    const HydrationActivityScreen(),//7
    const DailyIntakeActivityScreen(),//8
    const SavedWorkoutsMain(),//9
  ];

  void changePage(int index) {
    isSelected = index;
    emit(_pages[index]);
  }
}
