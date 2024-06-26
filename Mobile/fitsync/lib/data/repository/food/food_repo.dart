import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/data/repository/api.dart';

class FoodPlan{
Future<List<FoodModel>>getFoodPlan()async{
List<dynamic> data=
await Api().get(url: "https://fitsync-ai-api.onrender.com/food?Diabeties=0&Heart_Disease=1&Hypertension=1");


List<FoodModel> foodList=[];
for(int i=0;i<data.length;i++){

  foodList.add(FoodModel.fromJson(data[i]));

}

return foodList;


}
}