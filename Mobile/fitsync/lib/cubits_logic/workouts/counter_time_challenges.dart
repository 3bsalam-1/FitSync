import 'package:bloc/bloc.dart';
import '../../data/models/workouts_model.dart';

class CounterTimeChallenges extends Cubit<int> {
  CounterTimeChallenges() : super(15);
  late List<String> exercise;
  late WorkoutsModel currentWorkouts;
  List<int> exerciseTimeSec = [];
  late List<bool> isPrevouis;

  countDownFinish(int index) {
    isPrevouis[index] = true;
    emit(0);
  }

  setCounter(int seconds) => emit(seconds);

  intializeWorkout(WorkoutsModel workouts) {
    currentWorkouts = workouts;
    exercise = workouts.exercisePlan;
    isPrevouis = List.generate(
      workouts.exercisePlan.length,
      (index) => false,
    );
    emit(15);
  }

  intializeExercisesTime() {
    int seconds = (double.parse(currentWorkouts.planDurationMn) * 60).toInt();
    int length = currentWorkouts.exercisePlan.length;
    int singleTime = (seconds / length).floor();
    exerciseTimeSec = [];
    List.generate(
      length,
      (index) {
        if (index == 0) {
          exerciseTimeSec.add(seconds - (length - 1) * singleTime);
        } else {
          return exerciseTimeSec.add(singleTime);
        }
      },
    );
    emit(exerciseTimeSec[0]);
  }
}
