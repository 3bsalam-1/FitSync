import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiseQuestionsCubit extends Cubit<int> {
  ChoiseQuestionsCubit() : super(-1);
  
  void isSelected(int indexAnswer) => emit(indexAnswer); 
}
