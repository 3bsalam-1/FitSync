import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../services/pref.dart';
import '../../../shared/const/base_url.dart';
import '../../models/response_model.dart';

class UserAvatarRepo {
  // Method to change the user avatar
  Future<ResponseModel?> changeUserAvatar({
    required String token,
    required File image,
  }) async {
    try {
      var request = http.MultipartRequest(
        "PATCH",
        Uri.parse('$baseUrl/api/user/changeAvatar'),
      );
      request.headers.addAll({
        'Authorization': 'Bearer ${Prefs.getString('token')!}',
      });
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'avatar',
        image.path,
        filename: 'profile-avatar',
        contentType: MediaType(
          'file',
          image.path.split('.').last,
        ),
      );
      request.files.add(multipartFile);
      http.StreamedResponse response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        print('dffjghfdjghfd $value');
        print("the image type is ${image.path.split('.').last}");
      });
      //var data = jsonDecode(response);
      //return ResponseModel.fromJson(data);
      print("dffdgdfg ${response.stream.transform(utf8.decoder).last}");
      return null;
    } catch (e) {
      debugPrint('The changeUserAvatar Errror is: ${e.toString()}');
      return null;
    }
  }
}
