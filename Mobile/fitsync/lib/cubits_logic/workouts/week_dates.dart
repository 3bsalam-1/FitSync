import '../../services/week_dates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeekDatesCubit extends Cubit<List<Map<int, String>>> {
  WeekDatesCubit() : super(getWeekDates());
}