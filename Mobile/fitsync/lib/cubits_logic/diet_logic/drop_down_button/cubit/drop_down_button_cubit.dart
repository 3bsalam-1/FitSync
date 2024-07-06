import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'drop_down_button_state.dart';

class DropDownButtonCubit extends Cubit<DropDownButtonState> {
  DropDownButtonCubit() : super(DropDownButtonInitial());

  var selectedItem = "Vegetables";

  // ignore: non_constant_identifier_names
  onChanged_function() {
    emit(DropDownButtonInitial());
  }
}
