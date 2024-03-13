import 'dart:convert';
import '../../models/user_personal_info_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../services/pref.dart';
import '../../../shared/const/base_url.dart';
import '../../models/workouts_model.dart';

class WorkoutsRepo {
  Future<List<WorkoutsModel>?> getWorkoutsData(UserPersonalInfoGetModel userData) async {
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
      List<WorkoutsModel> data = body.map((json) => WorkoutsModel.fromJSON(json)).toList();
      return data;
    } catch (e) {
      debugPrint('The Error is: ${e.toString()}');
      return null;
    }
  }
}
