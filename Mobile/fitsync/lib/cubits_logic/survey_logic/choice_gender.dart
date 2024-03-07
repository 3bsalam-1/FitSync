import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/pref.dart';

class ChoiceGender extends Cubit<int> {
  ChoiceGender() : super(-1);

  void isMale() {
    Prefs.setString('gender', 'male');
    emit(0);
  }

  void isFemale() {
    Prefs.setString('gender', 'female');
    emit(1);
  }
}
