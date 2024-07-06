import 'dart:convert';
import 'package:fitsync/data/models/food_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../services/pref.dart';
import '../../../shared/const/base_url.dart';
import '../../models/response_model.dart';


class FavoritefoodRepo {
  Future<ResponseModel?> addfoodToFavorites({
    required FoodModel foods,
   // required String userId,
  }) async {
    try {
      List<dynamic> favorites = await getfoodFavoritesString();
      favorites.add(foods.convertToString());
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/fav-meal'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          //"userId": userId,
         // "favMeal": favorites,
         "favMeal": foods.convertToString(),
        }),
      );
      var json = jsonDecode(response.body);
      ResponseModel data = ResponseModel.fromJson(json);
      //print(favorites);
      return data;

    } catch (e) {
      debugPrint('The addMealssToFavorites Errror is: ${e.toString()}');
      return null;
    }
  }

  Future<ResponseModel?> removefoodfromFavorites({
    required FoodModel foods,
   // required String userId,
  }) async {
    try {
      List<dynamic> favorites = await getfoodFavoritesString();
      favorites.add(foods.convertToString());
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/fav-meal'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          //"userId": userId,
         // "favMeal": favorites,
         "favMeal": foods.convertToString(),
        }),
      );
      var json = jsonDecode(response.body);
      ResponseModel data = ResponseModel.fromJson(json);
      //print(favorites);
      return data;

    } catch (e) {
      debugPrint('The addMealssToFavorites Errror is: ${e.toString()}');
      return null;
    }
  }


  Future<List<FoodModel>> getFoodFavorites() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/api/fav-meal'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
      );
      Map<String, dynamic> body = jsonDecode(response.body);
      List<FoodModel> favoriteFood = [];
      List<dynamic> favoritesBody = body['data']['Data'];
      for (var element in favoritesBody) {
        List<String> data = element.split('*');
        if (data.length > 4) {
          favoriteFood.add(
            FoodModel(
              Name: data[0],
              Catagory: data[1],
              Description: data[2],
              Veg_non: data[3],
              Nutrient: data[4],
              Diet:data[5],
            ),
          );
        }
      }
      return favoriteFood;
    } catch (e) {
      debugPrint('The getFoodFavorites Errror is: ${e.toString()}');
      return [];
    }
  }

  Future<List<dynamic>> getfoodFavoritesString() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/api/fav-meal'),
        headers: {
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "application/json",
        },
      );
      Map<String, dynamic> body = jsonDecode(response.body);
      return body['data']['Data']?? [];
    } catch (e) {
      debugPrint('The getfoodFavoritesString Errror is: ${e.toString()}');
      return [];
    }
  }

}