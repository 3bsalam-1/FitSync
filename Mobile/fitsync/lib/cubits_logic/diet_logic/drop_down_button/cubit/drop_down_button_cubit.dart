import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drop_down_button_state.dart';

class DropDownButtonCubit extends Cubit<DropDownButtonState> {
  DropDownButtonCubit() : super(DropDownButtonInitial());


  var selectedItem = "Vegetables";

  onChanged_function(){

    emit(DropDownButtonInitial());
  }














}
