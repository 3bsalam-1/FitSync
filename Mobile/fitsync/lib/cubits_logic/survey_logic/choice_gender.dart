import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/pref.dart';

class ChoiceGender extends Cubit<int> {
  ChoiceGender() : super(-1);

  void isMale() {
    Prefs.setInt('gender', 0);
    emit(0);
  }

  void isFemale() {
    Prefs.setInt('gender', 1);
    emit(1);
  }
}
