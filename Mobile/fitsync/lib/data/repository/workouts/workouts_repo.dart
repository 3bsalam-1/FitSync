import 'dart:convert';
import '../../models/user_personal_info_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../shared/const/base_url.dart';
import '../../models/workouts_model.dart';

class WorkoutsRepo {
  Future<List<WorkoutsModel>?> getWorkoutsData(
    UserPersonalInfoGetModel userData,
  ) async {
    try {
      http.Response response = await http.get(
        Uri.https(baseUrlAi, '/workout', {
          'ID': '0',
          'Gender': userData.gender.toString(),
          'Knee_pain': userData.kneePain.toString(),
          'Back_pain': userData.backPain.toString(),
          'Diabeties': userData.diabetes.toString(),
          'Heart_Disease': userData.heartCondition.toString(),
          'Hypertension': userData.hypertension.toString(),
        }),
      );
      List<dynamic> body = jsonDecode(response.body);
      List<WorkoutsModel> data = body.map((json) => WorkoutsModel.fromJSON(json)).toList();
      return data;
    } catch (e) {
      debugPrint('The getWorkoutsData Error is: ${e.toString()}');
      return null;
    }
  }

  Future<List<WorkoutsModel>?> getAllWorkoutsData() async {
    try {
      http.Response response = await http.get(
        Uri.https(baseUrlAi, '/all_workouts'),
      );
      List<dynamic> body = jsonDecode(response.body);
      List<WorkoutsModel> data = body.map((json) => WorkoutsModel.fromJSON(json)).toList();
      return data;
    } catch (e) {
      debugPrint('The getAllWorkoutsData Error is: ${e.toString()}');
      return null;
    }
  }

  Future<List<WorkoutsModel>?> getWorkoutsChallenges(
    UserPersonalInfoGetModel userData,
  ) async {
    try {
      http.Response response = await http.get(
        Uri.https(baseUrlAi, '/challenges', {
          'ID': '0',
          'Gender': userData.gender.toString(),
          'Knee_pain': userData.kneePain.toString(),
          'Back_pain': userData.backPain.toString(),
          'Diabeties': userData.diabetes.toString(),
          'Heart_Disease': userData.heartCondition.toString(),
          'Hypertension': userData.hypertension.toString(),
        }),
      );
      List<dynamic> body = jsonDecode(response.body);
      List<WorkoutsModel> data = body.map((json) => WorkoutsModel.fromJSON(json)).toList();
      return data;
    } catch (e) {
      debugPrint('The getWorkoutsChallenges Error is: ${e.toString()}');
      return null;
    }
  }

  Future<Map?> getWorkoutsImages() async {
    const String url = 'https://drive.google.com/uc?export=view&id=16UZNRseZpdsXKKdlOEovajnXX7UWZTvR';
    try {
      http.Response response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      debugPrint('The getWorkoutsImages Error is: ${e.toString()}');
      return null;
    }
  }
}
