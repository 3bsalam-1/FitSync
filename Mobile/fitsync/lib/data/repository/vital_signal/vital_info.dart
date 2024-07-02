import '../../../services/pref.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../cubits_logic/global/new_token_cubit.dart';
import '../../../shared/const/base_url.dart';
import '../../models/response_model.dart';
import '../../models/vital_info_model.dart';
Future<ResponseModel?> saveVitalInfo({
  required num steps,
  required num heartRate,
  required num sleep,
}) async {
  NewTokenCubit().getNewToken();
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/vitalsignal'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
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
      debugPrint("The Response data of vital-info is ${body.status}");
      return body;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
}

Future<ResponseModel?> saveActiveHours(num activeHours) async {
  NewTokenCubit().getNewToken();
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/vitalsignal/active-hours'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "activeHours": activeHours,
        }),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      ResponseModel body = ResponseModel.fromJson(data);
      debugPrint("The Response data of saveActiveHours is ${body.status}");
      return body;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
}

Future<VitalInfoModel?> getVitalInfo() async {
  NewTokenCubit().getNewToken();
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/api/vitalsignal'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')}',
        },
      );
      Map<String, dynamic> json = jsonDecode(response.body);
      VitalInfoModel? data = VitalInfoModel.fromJson(json['data']['Data']);
      debugPrint("The Response get data of vital-info is ${data.toString()}");
      return data;
    } catch (e) {
      debugPrint('The get vital-info Errror is: ${e.toString()}');
      return null;
    }
}

Future<ResponseModel?> saveBurnedInfo({
  required num burned,
}) async {
  NewTokenCubit().getNewToken();
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/vitalsignal/burned'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "burned": burned,
        }),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      ResponseModel body = ResponseModel.fromJson(data);
      debugPrint(
          "The Response data of save burned Info data is ${body.status}");
      return body;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
}

Future<ResponseModel?> saveInTakeInfo(num inTake) async {
  NewTokenCubit().getNewToken();
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/vitalsignal/inTake'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "inTake": inTake,
        }),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      ResponseModel body = ResponseModel.fromJson(data);
      debugPrint("The Response data of saveInTakeInfo is ${body.status}");
      return body;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
}
