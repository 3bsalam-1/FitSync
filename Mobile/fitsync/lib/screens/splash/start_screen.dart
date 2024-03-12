import 'package:google_fonts/google_fonts.dart';
import '../../shared/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_button.dart';
import '../Login/login_screen.dart';
import '../Login/signup_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    purple,
                    purple,
                    cyan,
                  ],
                  end: Alignment.topLeft,
                  begin: Alignment.bottomRight,
                ),
              ),
              child: Image.asset(
                'assets/images/splash/run.png',
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Keep ',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: purple,
                ),
              ),
              Text(
                'Your Body Fit & Strong',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: black,
                ),
              ),
            ],
          ),
          Text(
            'Try it now to begin your life',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: gray,
            ),
          ),
          const Spacer(),
          CustomButton(
            label: 'Sign In',
            onPressed: () {
              AnimatedNavigator().pushReplacementScale(
                context,
                const LoginPage(),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            label: 'Sign Up',
            onPressed: () {
              AnimatedNavigator().pushReplacementScale(
                context,
                const SignUp(),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstPoint.dx,
      firstPoint.dy,
    );

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 70);

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondPoint.dx,
      secondPoint.dy,
    );

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
