import 'dart:convert';
import '../../models/user_personal_info_model.dart';
import 'package:flutter/material.dart';
import '../../../shared/const/base_url.dart';
import '../../models/response_model.dart';
import 'package:http/http.dart' as http;

class UserInfoRepo {

  // Method to send data to server to save it
  Future<ResponseModel?> sendUserInfo({
    required UserPersonalInfoModel info,
    required String token,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/userInfo'),
        headers: {
          "Authorization'": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "weight": info.weight,
          "height": info.height,
          "age": info.age,
          "gender": info.gender,
          "activityLevel": info.activityLevel,
          "systolicBP": info.systolicBP,
          "diastolicBP": info.diastolicBP,
          "cholesterolLevel": info.cholesterolLevel,
          "bloodSugar": info.bloodSugar,
          "hypertension": info.hypertension,
          "diabetes": info.diabetes,
          "heartCondition": info.heartCondition,
          "LowPressure": info.lowPressure,
          "bmr": info.bmr,
          "kneePain": info.kneePain,
          "backPain": info.backPain,
          "vegetarian": info.vegetarian,
        }),
      );
      var data = jsonDecode(response.body);
      ResponseModel responseData = ResponseModel.fromJson(data);
      return responseData;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
  }
  
  // Method to get the user personal information
  Future<UserPersonalInfoModel?> getUserInfo({required String token}) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/api/userInfo'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );
      var data = jsonDecode(response.body);
      UserPersonalInfoModel responseData = UserPersonalInfoModel.fromJson(data);
      return responseData;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
  }
}