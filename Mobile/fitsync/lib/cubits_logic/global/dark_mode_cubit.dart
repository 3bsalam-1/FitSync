import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../services/pref.dart';

class DarkModeCubit extends Cubit<ThemeData> {
  DarkModeCubit() : super(ThemeData.light()) {
    getThemeFromPrefs();
  }

  Future<void> saveThemeToPrefs({required Brightness brightness}) async {
    final themeIndex = brightness == Brightness.light ? 0 : 1;
    await Prefs.setInt('theme', themeIndex);
  }

  Future<void> getThemeFromPrefs() async {
    final savedThemeIndex = Prefs.getInt('theme') ?? 0;
    final savedTheme =
        savedThemeIndex == 0 ? ThemeData.light() : ThemeData.dark();
    emit(savedTheme);
  }

  void toggleTheme() {
    emit(state.brightness == Brightness.light
        ? ThemeData.dark()
        : ThemeData.light());
    saveThemeToPrefs(brightness: state.brightness);
  }
}
