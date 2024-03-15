import 'package:bloc/bloc.dart';
import '../../data/models/workouts_model.dart';

class CounterTimeChallenges extends Cubit<int> {
  CounterTimeChallenges() : super(15);
  late String currentExercise;
  late WorkoutsModel currentWorkouts;
  late List<int> exerciseTimeSec;

  changeExercises(int exerciseIndex, int secondes) {
    currentExercise = currentWorkouts.exercisePlan[exerciseIndex];
    emit(secondes);
  }

  intializeWorkout(WorkoutsModel workouts) {
    currentWorkouts = workouts;
    currentExercise = workouts.exercisePlan[0];
    emit(15);
  }

  intializeExercisesTime() {
    int seconds = (double.parse(currentWorkouts.planDurationMn) * 60).toInt();
    int length = currentWorkouts.exercisePlan.length;
    int singleTime = (seconds / length).floor();
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
