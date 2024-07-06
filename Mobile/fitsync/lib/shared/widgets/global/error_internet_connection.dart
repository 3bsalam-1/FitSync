import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../colors/colors.dart';

class ErrorInternetConnection extends StatefulWidget {
  const ErrorInternetConnection({super.key});

  @override
  State<ErrorInternetConnection> createState() =>
      _ErrorInternetConnectionState();
}

class _ErrorInternetConnectionState extends State<ErrorInternetConnection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    colorAnimation = ColorTween(begin: purple, end: gray3).animate(controller);
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.64,
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/splash/internet_connectivity.png",
          ),
          const SizedBox(height: 20),
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) => Text(
              "No Internet Connection",
              style: GoogleFonts.poppins(
                fontSize: 19,
                color: colorAnimation.value,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
