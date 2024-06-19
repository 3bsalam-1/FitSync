import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../services/pref.dart';
import '../../shared/const/base_url.dart';
import '../models/response_model.dart';
import 'login_res/user_auth_repo.dart';

Future<ResponseModel?> saveVitalInfo({
  required num steps,
  required num heartRate,
}) async {
  ResponseModel? token = await UserAuthRepo().userLogin(
    email: Prefs.getString('email')!,
    password: Prefs.getString('password')!,
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
