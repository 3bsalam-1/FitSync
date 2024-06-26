import 'package:bloc/bloc.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_ingredients_widget.dart';
import 'package:meta/meta.dart';

part 'changestate_state.dart';

class ChangestateCubit extends Cubit<ChangestateState> {
  ChangestateCubit() : super(ChangestateInitial());

  


  int change(){
    
    emit(ChangestateInitial());
    return calories;
  }

}
