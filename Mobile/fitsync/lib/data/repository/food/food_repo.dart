import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/data/repository/api.dart';
import 'package:fitsync/data/repository/user/user_info_repo.dart';

class FoodPlan{
Future<List<FoodModel>>getFoodPlan()async{

  var userInfo =  await UserInfoRepo().getUserInfo();


List<dynamic> data=
await Api().get(url: "https://fitsync-ai-api.onrender.com/food?Diabeties=${userInfo!.diabetes}&Heart_Disease=${userInfo.heartCondition}&Hypertension=${userInfo.hypertension}");


List<FoodModel> foodList=[];
for(int i=0;i<data.length;i++){

  foodList.add(FoodModel.fromJson(data[i]));

}

return foodList;


}
}