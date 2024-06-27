import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/const/base_url.dart';
import '../../models/response_model.dart';
import '../../models/vital_info_model.dart';
import '../login_res/user_auth_repo.dart';

Future<ResponseModel?> saveVitalInfo({
  required num steps,
  required num heartRate,
  required num sleep,
}) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.reload();
  ResponseModel? token = await UserAuthRepo().userLogin(
    email: prefs.getString('email')!,
    password: prefs.getString('password')!,
  );
  if (token != null) {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/vitalsignal'),
        headers: {
          'Authorization': 'Bearer ${token.token!}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "steps": steps,
          "avaheartbeat": heartRate,
          "sleepHours": sleep,
        }),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      ResponseModel body = ResponseModel.fromJson(data);
      debugPrint("The Response data of vital-info is $body");
      return body;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
  }
  return null;
}

Future<ResponseModel?> saveActiveHours(num activeHours) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.reload();
  ResponseModel? token = await UserAuthRepo().userLogin(
    email: prefs.getString('email')!,
    password: prefs.getString('password')!,
  );
  if (token != null) {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/vitalsignal/active-hours'),
        headers: {
          'Authorization': 'Bearer ${token.token!}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "activeHours": activeHours,
        }),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      ResponseModel body = ResponseModel.fromJson(data);
      debugPrint("The Response data of vital-info is $body");
      return body;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
  }
  return null;
}

Future<VitalInfoModel?> getVitalInfo() async {
  var prefs = await SharedPreferences.getInstance();
  ResponseModel? token = await UserAuthRepo().userLogin(
    email: prefs.getString('email')!,
    password: prefs.getString('password')!,
  );
  if (token != null) {
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/api/vitalsignal'),
        headers: {
          'Authorization': 'Bearer ${token.token!}',
        },
      );
      Map<String, dynamic> json = jsonDecode(response.body);
      VitalInfoModel data = VitalInfoModel.fromJson(json['data']['Data']);
      debugPrint("The Response get data of vital-info is $data");
      return data;
    } catch (e) {
      debugPrint('The get vital-info Errror is: ${e.toString()}');
      return null;
    }
  }
  return null;
}

Future<ResponseModel?> saveBurnedInfo({
  required num burned,
}) async {
  var prefs = await SharedPreferences.getInstance();
  ResponseModel? token = await UserAuthRepo().userLogin(
    email: prefs.getString('email')!,
    password: prefs.getString('password')!,
  );
  if (token != null) {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/vitalsignal/burned'),
        headers: {
          'Authorization': 'Bearer ${token.token!}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "burned": burned,
        }),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      ResponseModel body = ResponseModel.fromJson(data);
      debugPrint("The Response data of save burned Info data is $body");
      return body;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
  }
  return null;
}