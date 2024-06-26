import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/data/repository/api.dart';

class AllFood{
Future<List<FoodModel>>getAllFood()async{
List<dynamic> data=
await Api().get(url: "https://fitsync-ai-api.onrender.com/food_all?Diabeties=1&Heart_Disease=0&Hypertension=0");


List<FoodModel> foodList=[];
for(int i=0;i<data.length;i++){

  foodList.add(FoodModel.fromJson(data[i]));

}

return foodList;


}
}