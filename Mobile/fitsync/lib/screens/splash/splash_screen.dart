import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      AnimatedNavigator().pushAndRemoveUntil(
        context,
        const WelcomeScreen(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              purple5,
              cyan6,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Image.asset(
          'assets/images/splash/logo.png',
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
