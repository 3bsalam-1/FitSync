import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'water_add_state.dart';

class WaterAddCubit extends Cubit<WaterAddState> {
  WaterAddCubit() : super(WaterAddInitial());

  refreshCups(){
    emit(WaterAddInitial());
   }


}
