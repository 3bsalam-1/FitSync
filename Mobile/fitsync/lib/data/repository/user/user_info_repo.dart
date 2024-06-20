import 'dart:convert';
import '../../../services/pref.dart';
import '../../models/user_personal_info_model.dart';
import 'package:flutter/material.dart';
import '../../../shared/const/base_url.dart';
import '../../models/response_model.dart';
import 'package:http/http.dart' as http;

class UserInfoRepo {
  // Method to send data to server to save it
  Future<ResponseModel?> sendUserInfo({
    required UserPersonalInfoModel info,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/userInfo'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "weight": info.weight,
          "height": info.height,
          "birthdate": info.birthdate,
          "gender": info.gender,
          "activityLevel": info.activityLevel,
          "systolicBP": info.systolicBP,
          "diastolicBP": info.diastolicBP,
          "cholesterolLevel": info.cholesterolLevel,
          "bloodsugar": info.bloodSugar,
          "hypertension": info.hypertension,
          "diabetes": info.diabetes,
          "heartCondition": info.heartCondition,
          "LowPressure": info.lowPressure,
          "BMR": info.bmr,
          "kneePain": info.kneePain,
          "backPain": info.backPain,
          "vegetarian": info.vegetarian,
        }),
      );
      var data = jsonDecode(response.body);
      ResponseModel responseData = ResponseModel.fromJson(data);
      return responseData;
    } catch (e) {
      debugPrint('The sendUserInfo Errror is: ${e.toString()}');
      return null;
    }
  }

  // Method to get the user personal information
  Future<UserPersonalInfoGetModel?> getUserInfo() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/api/userInfo'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          'Content-Type': 'application/json',
        },
      );
      var data = jsonDecode(response.body);
      UserPersonalInfoGetModel responseData =
          UserPersonalInfoGetModel.fromJson(data);
      return responseData;
    } catch (e) {
      debugPrint('The getUserInfo Errror is: ${e.toString()}');
      return null;
    }
  }

  // update user info data
  Future<ResponseModel?> updateUserInfo({
    required num weight,
    required num height,
    required String birthdate,
    required int gender,
    required num systolicBP,
    required num diastolicBP,
    required bool kneePain,
    required bool backPain,
    required num cholesterolLevel,
    required num bloodSugar,
  }) async {
    try {
      http.Response response = await http.patch(
        Uri.parse('$baseUrl/api/userInfo'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "weight": weight,
          "height": height,
          "birthdate": birthdate,
          "gender": gender,
          "systolicBP": systolicBP,
          "diastolicBP": diastolicBP,
          "cholesterolLevel": cholesterolLevel,
          "bloodsugar": bloodSugar,
          "kneePain": kneePain,
          "backPain": backPain,
        }),
      );
      var data = jsonDecode(response.body);
      ResponseModel responseData = ResponseModel.fromJson(data);
      return responseData;
    } catch (e) {
      debugPrint('The updateUserInfo Errror is: ${e.toString()}');
      return null;
    }
  }
}
