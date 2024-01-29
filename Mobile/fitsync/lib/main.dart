import 'package:fitsync/screens/Login/SignUp_screen.dart';
import 'package:fitsync/screens/Login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits_logic/cubit/bluetooth_cubit.dart';
import 'package:flutter/material.dart';
import 'screens/survey/survey_screen.dart';

void main() {
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
        child: const signup(),
      ),
    );
  }
}
