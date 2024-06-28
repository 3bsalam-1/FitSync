import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/workouts_model.dart';
import '../../data/repository/vital_signal/vital_info.dart';
import '../../screens/workouts/workouts_view_challenge.dart';

class CounterTimeChallenges extends Cubit<int> {
  CounterTimeChallenges() : super(15);
  late int currentWorkoutIndex;
  late List<WorkoutsModel> allWorkouts;
  List<int> exerciseTimeSec = [];
  late List<bool> isPrevouis;
  late String calBurned;
  late int finishedExercises = 0;
  late int totalExerciseTime = 0;

  initalizeAllWorkouts(List<WorkoutsModel> workouts) {
    allWorkouts = workouts;
    emit(0);
  }

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
    for (int i = 0; i < isPrevouis.length; i++) {
      if (isPrevouis[i] == true) {
        totalExerciseTime += exerciseTimeSec[i];
        ++finishedExercises;
      }
    }
    calBurned = (double.parse(workouts.calBurned) *
            (finishedExercises / workouts.exercisePlan.length))
        .toStringAsFixed(2);

    totalExerciseTime = (totalExerciseTime ~/ 60);
    emit(20);
  }

  void saveWorkoutsActiveHours() async {
    var currentHours = DateTime.now().hour == 0 ? 24 : DateTime.now().hour;
    if (startWorkouts.hour == 0) {
      currentHours = (currentHours - 24).abs();
    } else {
      currentHours = (currentHours - startWorkouts.hour).abs();
    }
    startWorkouts = startWorkouts.subtract(
      Duration(
        minutes: DateTime.now().minute,
      ),
    );
    int result = (currentHours * 60) + (startWorkouts.minute).abs();
    await saveActiveHours(result);
    emit(15);
  }
}
