import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/Login/login_screen.dart';
import '../screens/home_main_screen.dart';
import '../screens/survey/welcome_survey_screen.dart';
import '../services/pref.dart';

class SplashScreenNextCubit extends Cubit<Widget> {
  SplashScreenNextCubit() : super(const LoginPage());

  bool? isLogin = Prefs.getBool('isLogin');
  bool? takeSurvey = Prefs.getBool('takeSurvey');

  final List<Widget> _pages = const [
    HomeMainScreen(),
    WelcomeSurveyScreen(),
    LoginPage(),
  ];

  void chechNextPage() {
    if (isLogin != null && takeSurvey != null) {
      // if the user take the survey & is login then go to home screen
      if (isLogin! && takeSurvey!) {
        emit(_pages[0]);
      } else if (isLogin! && !takeSurvey!) {
        // if the user login but do not take survey then go to survey screen
        emit(_pages[1]);
      } else {
        // if the user do not login or do not has account go to sigin screen
        emit(_pages[2]);
      }
    } else {
      // if the user do not login or do not has account go to sigin screen
      emit(_pages[2]);
    }
  }
}
