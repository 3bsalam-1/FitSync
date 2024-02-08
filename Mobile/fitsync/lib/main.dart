import 'package:fitsync/screens/Diet/diet_screen.dart';
import 'package:fitsync/screens/Diet/empty_state_screen.dart';
import 'package:fitsync/screens/Diet/meal_overview_screen.dart';
import 'package:fitsync/screens/Diet/saved_recipes_screen.dart';
import 'package:fitsync/screens/Home/home_screen.dart';
import 'package:fitsync/screens/Home/profile_screen.dart';
import 'package:fitsync/screens/Login/SignUp_screen.dart';
import 'package:fitsync/screens/Login/forgot_password_screen.dart';
import 'package:fitsync/screens/Login/login_screen.dart';
import 'package:fitsync/screens/Login/verification_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits_logic/cubit/bluetooth_cubit.dart';
import 'package:flutter/material.dart';
import 'cubits_logic/survey_logic/choise_questions_cubit.dart';
import 'cubits_logic/survey_logic/text_form_validation.dart';
import 'cubits_logic/workouts/week_dates.dart';
import 'screens/profile/profile_main_screen.dart';
import 'shared/pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitSync',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => BluetoothCubit()..checkBluetoothConnectivity(),
        child:  MealOverviewScreen(),
      ),
    );
  }
}
