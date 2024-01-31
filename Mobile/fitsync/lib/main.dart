import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits_logic/cubit/bluetooth_cubit.dart';
import 'package:flutter/material.dart';
import 'cubits_logic/cubit/text_form_validation.dart';
import 'screens/survey/welcome_survey_screen.dart';
import 'shared/pref.dart';
import 'screens/survey/weight_question_screen.dart';

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
          create: (context) => TextFormValidation(),
        ),
        BlocProvider(
          create: (context) => BluetoothCubit()..checkBluetoothConnectivity(),
        ),
      ],
      child: const MaterialApp(
        title: 'FitSync',
        debugShowCheckedModeBanner: false,
        home: WelcomeSurveyScreen(), 
      ),
    );
  }
}
