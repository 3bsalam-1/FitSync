import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiceGender extends Cubit<int> {
  ChoiceGender() : super(-1);

  void isMale() => emit(0);

  void isFemale() => emit(1);
}