import 'package:bloc/bloc.dart';
import 'package:fitsync/data/models/ingrediant_cals_model.dart';
import 'package:fitsync/data/repository/food/ingrediant_cals.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int index = 0;
  List<IngrediantModel> hjj=[];
                              int l=0;

  Future<int>fun(String lab) async {
    hjj = await IngredientCalories().getIngrediantCalories(lab);
    // print(hjj[0].caloriesPer100Grams);
    l += int.parse(hjj[0].caloriesPer100Grams);
   return l;
  }

  ontap() {
    emit(CounterInitial());
  }
}
