import 'package:fitsync/cubits_logic/diet_logic/counter/counter_cubit.dart';
import 'package:fitsync/cubits_logic/diet_logic/drop_down_button/cubit/drop_down_button_cubit.dart';
import 'package:fitsync/cubits_logic/diet_logic/favoriteIcon/cubit/favourite_icon_cubit.dart';
import 'package:fitsync/screens/Diet/diet_screen.dart';
import 'package:fitsync/screens/Diet/empty_state_screen.dart';
import 'package:fitsync/screens/Diet/meal_overview_screen.dart';
import 'package:fitsync/screens/Home/article_screen.dart';
import 'package:fitsync/screens/Home/calories_parameters_screen.dart';
import 'package:fitsync/screens/Home/heart_beat_screen.dart';
import 'package:fitsync/screens/Home/home_screen.dart';
import 'package:fitsync/screens/Home/notifications_screen.dart';
import 'package:fitsync/screens/Home/profile_screen.dart';
import 'package:fitsync/screens/Home/sleep_parameters_screen.dart';
import 'package:fitsync/screens/Home/steps_parameters_screen.dart';
import 'package:fitsync/screens/Home/tips&tricks_screen.dart';
import 'package:fitsync/screens/Home/water_parameters_screen.dart';
import 'package:fitsync/screens/Login/SignUp_screen.dart';
import 'package:fitsync/screens/Login/login_screen.dart';
import 'package:fitsync/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits_logic/cubit/bluetooth_cubit.dart';
import 'package:flutter/material.dart';
import 'cubits_logic/navigation_page_cubit.dart';
import 'cubits_logic/survey_logic/animated_list_view.dart';
import 'cubits_logic/survey_logic/choise_questions_cubit.dart';
import 'cubits_logic/survey_logic/text_form_validation_cubit.dart';
import 'cubits_logic/workouts/week_dates.dart';
import 'screens/home_main_screen.dart';
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
          create: (context) => WeekDatesCubit()..showWeekDays(),
        ),
        BlocProvider(
          create: (context) => NavigationPageCubit(),
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
      ],
      child: MaterialApp(
        title: 'FitSync',
        debugShowCheckedModeBanner: false,
        home: HomeMainScreen(), //SplashScreen(),
      ),
    );
  }
}
