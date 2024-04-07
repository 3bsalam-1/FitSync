import 'dart:convert';
import '../../models/response_model.dart';
import '../../models/user_personal_info_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../services/pref.dart';
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
        headers: {
          "Authorization": "Bearer ${Prefs.getString('token')!}",
        },
      );
      List<dynamic> body = jsonDecode(response.body);
      List<WorkoutsModel> data =
          body.map((json) => WorkoutsModel.fromJSON(json)).toList();
      return data;
    } catch (e) {
      debugPrint('The Error is: ${e.toString()}');
      return null;
    }
  }

  Future<List<WorkoutsModel>?> getAllWorkoutsData(
    UserPersonalInfoGetModel userData,
  ) async {
    try {
      http.Response response = await http.get(
        Uri.https(baseUrlAi, '/all_workout', {
          'ID': '0',
          'Gender': userData.gender.toString(),
          'Knee_pain': userData.kneePain.toString(),
          'Back_pain': userData.backPain.toString(),
          'Diabeties': userData.diabetes.toString(),
          'Heart_Disease': userData.heartCondition.toString(),
          'Hypertension': userData.hypertension.toString(),
        }),
        headers: {
          "Authorization": "Bearer ${Prefs.getString('token')!}",
        },
      );
      List<dynamic> body = jsonDecode(response.body);
      List<WorkoutsModel> data =
          body.map((json) => WorkoutsModel.fromJSON(json)).toList();
      return data;
    } catch (e) {
      debugPrint('The Error is: ${e.toString()}');
      return null;
    }
  }

  Future<ResponseModel?> addWorkoutsToFavorites({
    required WorkoutsModel workouts,
    required String userId,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/workout'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "userId": userId,
          "workouts": jsonEncode(workouts.toMap()),
        }),
      );
      var json = jsonDecode(response.body);
      ResponseModel data = ResponseModel.fromJson(json);
      return data;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
  }

  // todo handle the data that come from the api
  Future<dynamic> getWorkoutsFavorites() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/api/workout'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
      );
      var json = jsonDecode(response.body);
      //List<WorkoutsModel> data = WorkoutsModel.fromJSON(json);
      print('the favorites workouts is: $json');
      //return data;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
  }
}
