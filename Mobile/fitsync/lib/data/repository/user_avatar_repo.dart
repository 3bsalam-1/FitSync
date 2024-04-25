import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../shared/const/base_url.dart';
import '../models/response_model.dart';

class UserAvatarRepo {
  // Method to change the user avatar
  Future<ResponseModel?> changeUserAvatar({
    required String token,
    required File image,
  }) async {
    try {
      final request = http.MultipartRequest(
        'PATCH',
        Uri.parse('$baseUrl/api/user/changeAvatar'),
      );
      request.files.add(
        http.MultipartFile.fromBytes(
          'avatar',
          image.readAsBytesSync(),
          filename: image.path,
        ),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Content-Type'] = 'multipart/form-data';
      final response = await request.send();
      final body = await response.stream.bytesToString();
      final data = jsonDecode(body);
      return ResponseModel.fromJson(data);
    } catch (e) {
      debugPrint('The Errror is: ${e.toString()}');
      return null;
    }
  }
}
