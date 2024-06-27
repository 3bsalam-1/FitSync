import 'dart:convert';
import 'package:fitsync/screens/workouts/workouts_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/const/base_url.dart';
import '../user/user_info_repo.dart';

Future<List<int>> checkHeartrate() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.reload();
  var data = await UserInfoRepo().getUserInfo();
  if (data != null) {
    try {
      http.Response response = await http.get(
        Uri.https(
            baseUrlAi,
            '/pulse',
            {
              'Age': (data.birthdate.year - DateTime.now().year),
              'Activity_level': data.activityLevel,
              'Active': isActiveCurrent,
            }.map((key, value) => MapEntry(key, value.toString()))),
      );
      var body = jsonDecode(response.body);
      debugPrint(
          'The min heart rate is ${body['Min']} the max heart rate ${body['Max']}');
      int min = int.parse(body['Min']);
      int max = int.parse(body['Max']);
      return [min, max];
    } catch (e) {
      debugPrint("the checkHeartrate error is: ${e.toString()}");
      return [];
    }
  } else {
    return [];
  }
}
