import 'package:fitsync/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits_logic/cubit/bluetooth_cubit.dart';
import 'package:flutter/material.dart';
import 'cubits_logic/survey_logic/animated_list_view.dart';
import 'cubits_logic/survey_logic/choise_questions_cubit.dart';
import 'cubits_logic/survey_logic/text_form_validation_cubit.dart';
import 'cubits_logic/workouts/week_dates.dart';
import 'screens/activity/activity_main_screen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TextFormValidationCubit(),
        ),
        BlocProvider(
          create: (context) => BluetoothCubit()..checkBluetoothConnectivity(),
        ),
        BlocProvider(
          create: (context) => ChoiseQuestionsCubit(),
        ),
        BlocProvider(
          create: (context) => AnimatedListView()..startAnimation(),
        ),
        BlocProvider(
          create: (context) => WeekDatesCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'FitSync',
        debugShowCheckedModeBanner: false,
        home: ActivityMainScreen(),//SplashScreen(), 
      ),
    );
  }
}
