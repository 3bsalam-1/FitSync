import 'package:fitsync/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits_logic/cubit/bluetooth_cubit.dart';
import 'screens/bluetooth_scan_screen.dart';
import 'package:flutter/material.dart';

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
        child: const SplashScreen(),
      ),
    );
  }
}
