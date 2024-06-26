
import 'package:fitsync/data/models/ingrediant_cals_model.dart';
import 'package:fitsync/data/repository/api.dart';

class IngredientCalories{
Future<List<IngrediantModel>>getIngrediantCalories(String variable1)async{
List<dynamic> data=
await Api().get(url: "https://fitsync-ai-api.onrender.com/Ingredients?Ingredient=$variable1");


List<IngrediantModel> ingrediantList=[];
for(int i=0;i<data.length;i++){

  ingrediantList.add(IngrediantModel.fromJson(data[i]));

}

return ingrediantList;


}
}