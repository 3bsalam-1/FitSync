import 'dart:convert';
import 'package:fitsync/screens/workouts/workouts_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../shared/const/base_url.dart';
import '../user/user_info_repo.dart';

Future<List<num>> checkHeartrate() async {
  var data = await UserInfoRepo().getUserInfo();
  if (data != null) {
    http.Response response = await http.get(
      Uri.https(baseUrlAi, '/workout', {
        'Age': data.birthdate.year-DateTime.now().year,
        'Activity_level': data.activityLevel,
        'Active': isActiveCurrent,
      }),
    );
    var body = jsonDecode(response.body);
    debugPrint('The min heart rate is ${body['Min']} the max heart rate ${body['Max']}');
    return [int.parse(body['Min']), int.parse(body['Max'])];
  } else {
    return [];
  }
}
