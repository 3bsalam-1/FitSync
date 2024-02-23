import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/Diet/diet_screen.dart';
import '../screens/Home/home_screen.dart';
import '../screens/activity/activity_main_screen.dart';
import '../screens/activity/daily_intake_activity_screen.dart';
import '../screens/activity/daily_steps_activity_screen.dart';
import '../screens/activity/hydration_activity_screen.dart';
import '../screens/activity/sleep_activity_screen.dart';
import '../screens/profile/profile_main_screen.dart';
import '../screens/workouts/workouts_screen.dart';

class NavigationPageCubit extends Cubit<Widget> {
  NavigationPageCubit() : super(const HomePage());
  int isSelected = 0;
  
  final List<Widget> _pages = [
    const HomePage(),
    const WorkoutsScreen(),
    const DietScreen(),
    const ActivityMainScreen(),
    const ProfileMainScreen(),
    const SleepActivityScreen(),
    const DailyStepsActivityScreen(),
    const HydrationActivityScreen(),
    const DailyIntakeActivityScreen(),
  ];

  void changePage(int index) {
    isSelected = index;
    emit(_pages[index]);
  }
}
