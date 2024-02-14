import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../shared/const/base_url.dart';
import '../models/response_model.dart';

class PasswordRepo {

  // Method send email when user forget password
  Future<ResponseModel?> forgetPassword({required String email}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/user/forgetPassword'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"email": email}),
      );
      var data = jsonDecode(response.body);
      ResponseModel responseData = ResponseModel.fromJson(data);
      return responseData;
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
  }

  // Method send the passward,passwordConfirm & token for resetting user password 
  Future<ResponseModel?> resetPassword({
    required String password,
    required String passwordConfirm,
    required String token,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/user/resetPassword'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "password": password,
          "passwordConfirm": passwordConfirm,
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

  // Method for updating the password
  Future<ResponseModel?> updatePassword({
    required String password,
    required String passwordConfirm,
    required String oldPassword,
    required String token,
  }) async {
    try {
      http.Response response = await http.patch(
        Uri.parse('$baseUrl/api/user/updatePassword'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "oldPassword": oldPassword,
          "password": password,
          "passwordConfirm": passwordConfirm,
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
