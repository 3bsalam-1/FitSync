import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedLevelMode extends Cubit<int> {
  SelectedLevelMode() : super(0);
  List<String> level = ['Recent', 'Beginner', 'Intermediate', 'Advanced'];
  selectedLevel(int index) => emit(index);
}
