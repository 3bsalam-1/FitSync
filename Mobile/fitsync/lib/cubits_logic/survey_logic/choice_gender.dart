import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/pref.dart';

class ChoiceGender extends Cubit<int> {
  ChoiceGender() : super(-1);

  void isMale() {
    // todo check if the user take the survey
    Prefs.setString('gender', 'male');
    emit(0);
  }

  void isFemale() {
    // todo first check if the user take the survey
    Prefs.setString('gender', 'female');
    emit(1);
  }
}
