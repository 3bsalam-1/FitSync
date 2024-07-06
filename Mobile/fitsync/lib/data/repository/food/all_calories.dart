import 'package:fitsync/data/models/all_calories.dart';
import 'package:fitsync/data/repository/api.dart';
import 'package:fitsync/data/repository/user/user_info_repo.dart';

class AllCalories{
Future<AllCaloriesModel>getAllCalories()async{
  var userInfo =  await UserInfoRepo().getUserInfo();
  
  
   final data=
await Api().get(url: "https://fitsync-ai-api.onrender.com/calories?Age=59&Gender=${userInfo!.gender}&Weight=${userInfo.weight}&Height=${userInfo.height}&Activity_Level=${userInfo.activityLevel}&Systolic_BP=${userInfo.systolicBP}&Diastolic_BP=${userInfo.diastolicBP}&Cholesterol_Level=${userInfo.cholesterolLevel}&Blood_Sugar=${userInfo.bloodSugar}&Hypertension=${userInfo.hypertension}&Low_Pressure=${userInfo.lowPressure}&Diabetes=${userInfo.diabetes}&Heart_Condition=${userInfo.heartCondition}&BMR=${userInfo.bmr}");
  



return AllCaloriesModel.fromJson(data);


}
}