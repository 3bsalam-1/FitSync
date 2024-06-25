import '../../shared/widgets/global/custom_animated_opacity.dart';
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
    Future.delayed(const Duration(seconds: 2), () {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    dotsGenerating(),
                    const SizedBox(height: 30),
                    dotsGenerating(),
                  ],
                ),
                Image.asset(
                  'assets/images/splash/x_vector.png',
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 50,
              ),
              child: Image.asset(
                'assets/images/splash/x_vector2.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            CustomAnimatedOpacity(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/splash/logo.png',
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Image.asset(
                    'assets/images/splash/logo_name.png',
                    height: 75,
                    width: 190,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.only(left: 80),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: white,
                  width: 1.3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60, top: 50),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/images/splash/x_vector.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 50),
              child: Image.asset(
                'assets/images/splash/x_vector2.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

Widget dotsGenerating() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(
      4,
      (index) => Padding(
        padding: const EdgeInsets.only(right: 40),
        child: CircleAvatar(
          radius: 3,
          backgroundColor: white.withOpacity(0.2),
        ),
      ),
    ),
  );
}
