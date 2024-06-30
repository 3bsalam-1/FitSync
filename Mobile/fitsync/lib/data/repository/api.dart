import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            "there is a problem with status code ${response.statusCode}");
      }
    } catch (e) {
      print("The Error is: ${e.toString()}");
    }
  }

  Future<dynamic> post({required String url, @required dynamic body}) async {
    try {
      Map<String, String> headers = {};

      http.Response response =
          await http.post(Uri.parse(url), body: body, headers: headers);

     if (response.statusCode == 200) {
      return jsonDecode(response.body);}
      else{
         throw Exception(
            "there is a problem with status code ${response.statusCode}");
      }
    } catch (e) {
      print('The Error is: ${e.toString()}');
    }
  }
}
