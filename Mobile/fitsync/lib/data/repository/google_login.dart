import 'package:fitsync/data/models/response_model.dart';
import 'package:fitsync/data/repository/api.dart';
import 'package:fitsync/services/pref.dart';
import 'package:fitsync/shared/const/base_url.dart';
import 'package:flutter/material.dart';

class ContinueWithGoogle {
  Future<ResponseModel?> continueWithGoogle({
    required String name,
    required String email,
    required String avatar,
  }) async {
    try {
      Map<String, dynamic> response =
          await Api().post(url: "$baseUrl/api/auth/ContinueWithGoogle", body: {
        "name": name,
        "email": email,
        "avatar": avatar,
      });
      var data = ResponseModel.fromJson(response);
      return data;
    } catch (e) {
      debugPrint('There is an error in continueWithGoogle: ${e.toString()}');
      return null;
    }
  }
}
