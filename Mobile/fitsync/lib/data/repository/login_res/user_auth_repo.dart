import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../shared/const/base_url.dart';
import '../../models/response_model.dart';
import '../../models/user_data_model.dart';
import 'package:http/http.dart' as http;

class UserAuthRepo {
  // Method to send user data to create new account
  Future<ResponseModel?> userRegister({required UserDataModel userData}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/auth/register'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "firstName": userData.firstName,
          "lastName": userData.lastName,
          "username": userData.username,
          "email": userData.email,
          "password": userData.password,
          "passwordConfirm": userData.passwordConfirm,
        }),
      );
      var data = jsonDecode(response.body);
      ResponseModel responseData = ResponseModel.fromJson(data);
      debugPrint('The register data is ${responseData.message}');
      return responseData;
    } catch (e) {
      debugPrint('The userRegister Errror is: ${e.toString()}');
      return null;
    }
  }

  // Method to send email & password to login
  Future<ResponseModel?> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      var data = jsonDecode(response.body);
      ResponseModel responseData = ResponseModel.fromJson(data);
      debugPrint('The login data is ${responseData.message}');
      return responseData;
    } catch (e) {
      debugPrint('The userLogin Errror is: ${e.toString()}');
      return null;
    }
  }
}
