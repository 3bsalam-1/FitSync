import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../services/pref.dart';

class DarkModeCubit extends Cubit<bool> {
  DarkModeCubit() : super(false);

  void isDarkMode() {
    if (Prefs.getBool("dark-mode") != null) {
      if (Prefs.getBool("dark-mode")!) {
        emit(true);
      } else {
        emit(false);
      }
    }
  }

  void cahngeMode(bool value) {
    if (value) {
      Prefs.setBool("dark-mode", true);
      ThemeMode.dark;
      emit(true);
    } else {
      Prefs.setBool("dark-mode", false);
      ThemeMode.light;
      emit(false);
    }
  }
}
