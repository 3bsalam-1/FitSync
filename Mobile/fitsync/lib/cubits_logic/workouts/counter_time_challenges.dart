import 'package:bloc/bloc.dart';
import '../../data/models/workouts_model.dart';

class CounterTimeChallenges extends Cubit<int> {
  CounterTimeChallenges() : super(15);
  late int currentWorkoutIndex;
  List<int> exerciseTimeSec = [];
  late List<bool> isPrevouis;
  late String calBurned;
  late int finishedExercises;
  late int totalExerciseTime = 0;

  countDownFinish(int index) {
    isPrevouis[index] = true;
    emit(0);
  }

  setCounter(int seconds) => emit(seconds);

  initalizeExerciseTimeSec(int totalTime, int singleTime, int length) {
    exerciseTimeSec = List.generate(
      length,
      (index) {
        if (index == 0) {
          return (totalTime - (length - 1) * singleTime);
        } else {
          return singleTime;
        }
      },
    );
    isPrevouis = List.generate(
      length,
      (index) => false,
    );
    emit(20);
  }

  void getExerciseResult(WorkoutsModel workouts) {
    finishedExercises = isPrevouis.where((e) => true).length;
    calBurned = (double.parse(workouts.calBurned) *(finishedExercises / workouts.exercisePlan.length)).toStringAsFixed(2);

    for (int i = 0; i < isPrevouis.length; i++) {
      if (isPrevouis[i] == true) {
        print('the date is ${isPrevouis[i]}');
        totalExerciseTime += exerciseTimeSec[i];
      }
    }
    totalExerciseTime = (totalExerciseTime ~/ 60);
    emit(20);
  }
}
