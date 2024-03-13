import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../services/pref.dart';
import '../../../shared/const/base_url.dart';
import '../../models/workouts_model.dart';

class WorkoutsRepo {
  Future<List<WorkoutsModel>?> getWorkoutsData({
    required num id,
    required int gender,
    required int kneeP,
    required int backP,
    required int diabeties,
    required int heart,
    required int hyper,
  }) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          '$baseUrlAi/workout?ID=$id&Gender=$gender&Knee_pain=$kneeP&Back_pain=$backP&Diabeties=$diabeties&Heart_Disease=$heart&Hypertension=$hyper',
        ),
        headers: {
          "Authorization": "Bearer ${Prefs.getString('token')!}",
        },
      );
      List<Map<String, String>> body = jsonDecode(response.body);
      List<WorkoutsModel> data = body.map((json) => WorkoutsModel.fromJSON(json)).toList();
      return data;
    } catch (e) {
      debugPrint('The Error is: ${e.toString()}');
      return null;
    }
  }
}
