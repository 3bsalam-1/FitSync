import 'cubits_logic/new_token_cubit.dart';
import 'cubits_logic/smart_watch/smart_watch_cubit.dart';
import 'cubits_logic/splash_screen_next_cubit.dart';
import 'cubits_logic/diet_logic/counter/counter_cubit.dart';
import 'cubits_logic/diet_logic/drop_down_button/cubit/drop_down_button_cubit.dart';
import 'cubits_logic/diet_logic/favoriteIcon/cubit/favourite_icon_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'cubits_logic/navigation_page_cubit.dart';
import 'cubits_logic/survey_logic/choise_questions_cubit.dart';
import 'cubits_logic/survey_logic/text_form_validation_cubit.dart';
import 'cubits_logic/workouts/counter_time_challenges.dart';
import 'cubits_logic/workouts/week_dates.dart';
import 'data/cubit/auth/auth_cubit.dart';
import 'data/cubit/user_data/user_data_info_cubit.dart';
import 'data/cubit/workouts/workouts_cubit.dart';
import 'screens/splash/splash_screen.dart';
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
          create: (context) => ChoiseQuestionsCubit(),
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
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => DropDownButtonCubit(),
        ),
        BlocProvider(
          create: (context) => FavouriteIconCubit(),
        ),
        BlocProvider(
          create: (context) => UserDataInfoCubit(),
        ),
        BlocProvider(
          create: (context) => NewTokenCubit()..getNewToken(),
        ),
        BlocProvider(
          create: (context) => WorkoutsCubit(),
        ),
        BlocProvider(
          create: (context) => CounterTimeChallenges(),
        ),
        BlocProvider(
          create: (context) => SmartWatchCubit()..intializeSmartWatchConnection(),
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
