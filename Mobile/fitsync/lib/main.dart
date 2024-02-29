import 'cubits_logic/splash_screen_next_cubit.dart';
import 'screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits_logic/cubit/bluetooth_cubit.dart';
import 'package:flutter/material.dart';
import 'cubits_logic/navigation_page_cubit.dart';
import 'cubits_logic/survey_logic/animated_list_view.dart';
import 'cubits_logic/survey_logic/choise_questions_cubit.dart';
import 'cubits_logic/survey_logic/text_form_validation_cubit.dart';
import 'cubits_logic/workouts/week_dates.dart';
import 'data/cubit/auth_cubit.dart';
import 'services/pref.dart';

void main() async {
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
          create: (context) => WeekDatesCubit()..showWeekDays(),
        ),
        BlocProvider(
          create: (context) => NavigationPageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => SplashScreenNextCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'FitSync',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
