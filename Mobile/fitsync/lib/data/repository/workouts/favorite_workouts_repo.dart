import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../services/pref.dart';
import '../../../shared/const/base_url.dart';
import '../../models/response_model.dart';
import '../../models/workouts_model.dart';

class FavoriteWorkoutsRepo {
  Future<ResponseModel?> addWorkoutsToFavorites({
    required WorkoutsModel workouts,
    required String userId,
  }) async {
    try {
      List<dynamic> favorites = await getWorkoutsFavoritesString();
      favorites.add(workouts.toString());
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/workout'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "userId": userId,
          "workout": favorites,
        }),
      );
      var json = jsonDecode(response.body);
      ResponseModel data = ResponseModel.fromJson(json);
      return data;
    } catch (e) {
      debugPrint('The addWorkoutsToFavorites Errror is: ${e.toString()}');
      return null;
    }
  }

  Future<List<WorkoutsModel>> getWorkoutsFavorites() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/api/workout'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
      );
      Map<String, dynamic> body = jsonDecode(response.body);
      List<WorkoutsModel> favoriteWorkouts = [];
      List<dynamic> favoritesBody = body['data']['Data'];
      for (var element in favoritesBody) {
        List<String> data = element.split('*');
        if (data.length > 4) {
          favoriteWorkouts.add(
            WorkoutsModel(
              exercisePlan: convertStringToList(
                  data[0].replaceAll('[', '').replaceAll(']', '')),
              category: data[1],
              level: data[2],
              planDurationMn: data[3],
              calBurned: data[4],
              targetMuscle: convertStringToList(
                  data[5].replaceAll('[', '').replaceAll(']', '')),
            ),
          );
        }
      }
      return favoriteWorkouts;
    } catch (e) {
      debugPrint('The getWorkoutsFavorites Errror is: ${e.toString()}');
      return [];
    }
  }

  Future<List<dynamic>> getWorkoutsFavoritesString() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/api/workout'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
      );
      Map<String, dynamic> body = jsonDecode(response.body);
      return body['data']['Data']['workouts'] ?? [];
    } catch (e) {
      debugPrint('The getWorkoutsFavoritesString Errror is: ${e.toString()}');
      return [];
    }
  }
}
