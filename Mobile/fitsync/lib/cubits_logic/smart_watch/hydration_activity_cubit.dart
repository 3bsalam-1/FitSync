import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../services/pref.dart';
part 'hydration_activity_state.dart';

class HydrationActivityCubit extends Cubit<HydrationActivityState> {
  HydrationActivityCubit() : super(HydrationActivityInitial());
  int glasses = 1;
  int takedGlesses = 0;
  double progress = 0;
  double waterTaked = 0;

  void addGlass() {
    if (glasses == 15) {
      emit(HydrationNumberGlasses());
    } else {
      ++glasses;
      emit(HydrationNumberGlasses());
    }
  }

  void minusGlass() {
    if (glasses == 1) {
      emit(HydrationNumberGlasses());
    } else {
      --glasses;
      emit(HydrationNumberGlasses());
    }
  }

  void saveTekedGlasses() {
    takedGlesses = glasses;
    waterTaked = glasses * 200;
    double glassGoal = Prefs.getDouble("water-glass") ?? 1;
    progress = ((takedGlesses / glassGoal) * 100).roundToDouble();
    if (progress > 100) {
      progress = 100;
    }
    emit(HydrationSaveGlasses());
  }
}
