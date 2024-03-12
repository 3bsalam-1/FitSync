import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/Login/login_screen.dart';
import '../screens/home_main_screen.dart';
import '../screens/splash/start_screen.dart';
import '../screens/survey/welcome_survey_screen.dart';
import '../services/decode_jwt.dart';
import '../services/pref.dart';

class SplashScreenNextCubit extends Cubit<Widget> {
  SplashScreenNextCubit() : super(const LoginPage());

  final List<Widget> _pages = const [
    HomeMainScreen(),
    WelcomeSurveyScreen(),
    StartScreen(),
  ];

  void splashNextPage() {
    bool? isLogin = Prefs.getBool('isLogin');

    if (isLogin != null) {
      // if the user login then go to home screen
      if (isLogin) {
        emit(_pages[0]);
      } else {
        // if the user log out go to sigin screen
        emit(_pages[2]);
      }
    } else {
      // if the user do not has an account go to sigin screen
      emit(_pages[2]);
    }
  }

  Widget loginNextScreen() {
    decodeJWT();
    bool takeSurvey = Prefs.getBool('survey')!;
    if (takeSurvey) {
      // The user was taken survey so they will save as login to the app
      Prefs.setBool('isLogin', true);
      // if the user take the survey then go to home page
      return _pages[0];
    } else {
      // if the the user do not take the survey then go to the survey page
      return _pages[1];
    }
  }
}
