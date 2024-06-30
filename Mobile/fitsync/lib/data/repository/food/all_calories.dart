import 'package:fitsync/data/models/all_calories.dart';
import 'package:fitsync/data/repository/api.dart';
import 'package:fitsync/data/repository/user/user_info_repo.dart';

class AllCalories{
Future<AllCaloriesModel>getAllCalories()async{
  var userInfo =  await UserInfoRepo().getUserInfo();
  
  
   final data=
await Api().get(url: "https://fitsync-ai-api.onrender.com/calories?Age=59&Gender=${userInfo!.gender}&Weight=96&Height=162&Activity_Level=4&Systolic_BP=95&Diastolic_BP=80&Cholesterol_Level=247&Blood_Sugar=105&Hypertension=0&Low_Pressure=0&Diabetes=0&Heart_Condition=1&BMR=1680");
  



return AllCaloriesModel.fromJson(data);


}
}