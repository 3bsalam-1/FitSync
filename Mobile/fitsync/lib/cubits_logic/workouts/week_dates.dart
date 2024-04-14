import '../../services/week_dates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeekDatesCubit extends Cubit<List<Map<int, String>>> {
  WeekDatesCubit() : super([]);
  List<Map<int, String>> data = [];
  int isSelected = DateTime.now().weekday - 1;

  void showWeekDays() {
    data = getWeekDates();
    emit(data);
  }

  void isSeleced(int dayIndex) {
    isSelected = dayIndex;
    data = getWeekDates();
    emit(data);
  }
}
