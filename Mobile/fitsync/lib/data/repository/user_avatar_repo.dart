import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../shared/const/base_url.dart';
import '../models/response_model.dart';

class UserAvatarRepo {
  // Method to change the user avatar 
  Future<ResponseModel?> userRegister({
    required String token,
    required dynamic image,
  }) async {
    try {
      http.Response response = await http.patch(
        Uri.parse('$baseUrl/api/user/changeAvatar'),
        headers: {
          "Content-Type": "multipart/form-data; boundary=<calculated when request is sent>",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "avatar": image,
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
}