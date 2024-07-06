import 'dart:convert';
import '../../models/response_model.dart';
import 'package:flutter/material.dart';
import '../../../shared/const/base_url.dart';
import 'package:http/http.dart' as http;

class CodeConfirmRepo {
  // Method for sending the code for verfiy
  Future<ResponseModel?> confirmCodeVerfiy({
    required String token,
    required String code,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/auth/verfiy'),
        headers: {
          'Authorization': 'Bearer $token',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "code": code,
        }),
      );
      var data = jsonDecode(response.body);
      ResponseModel responseData = ResponseModel.fromJson(data);
      debugPrint('The confirmCodeVerfiy response is: ${response.statusCode}');
      return responseData;
    } catch (e) {
      debugPrint('The confirmCodeVerfiy Errror is: ${e.toString()}');
      return null;
    }
  }

  // Method send only the token for sending the code to verfiy
  Future<ResponseModel?> sendCodeToVerfiy({required String token}) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/api/auth/sendCodeVerfiy'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      var data = jsonDecode(response.body);
      ResponseModel responseData = ResponseModel.fromJson(data);
      debugPrint('The sendCodeToVerfiy response is: ${response.statusCode}');
      return responseData;
    } catch (e) {
      debugPrint('The sendCodeToVerfiy Errror is: ${e.toString()}');
      return null;
    }
  }

  // Method send only the code for forget password
  Future<ResponseModel?> codeReset({required String code}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/auth/codeReset'),
        body: jsonEncode({
          "code": code,
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );
      var data = jsonDecode(response.body);
      ResponseModel responseData = ResponseModel.fromJson(data);
      debugPrint('The condeReset response is: ${response.statusCode}');
      return responseData;
    } catch (e) {
      debugPrint('The codeReset Errror is: ${e.toString()}');
      return null;
    }
  }
}
