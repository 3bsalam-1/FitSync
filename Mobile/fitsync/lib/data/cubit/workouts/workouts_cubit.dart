import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../services/isolate_service.dart';
import '../../models/user_personal_info_model.dart';
import '../../models/workouts_model.dart';
import '../../repository/workouts/workouts_repo.dart';
part 'workouts_state.dart';

class WorkoutsCubit extends Cubit<WorkoutsState> {
  WorkoutsCubit() : super(WorkoutsInitial());
  final workRepo = WorkoutsRepo();
  final isolate = IsolateService();
  Map? workoutsImages;
  List<WorkoutsModel>? data;
  List<WorkoutsModel>? challenges;
  Map<String, List<WorkoutsModel>>? allworkouts;
  List<WorkoutsModel> dataLevel = [];
  bool viewAllChallenge = false;

  void getWorkoutsData(UserPersonalInfoGetModel userData) async {
    workoutsImages = await workRepo.getWorkoutsImages();
    if (data == null) {
      workRepo.getWorkoutsData(userData).then((response) {
        if (response != null) {
          data = dataLevel = response;
          emit(WorkoutsLoaded());
        } else {
          emit(WorkoutsFialure());
        }
      });
      emit(WorkoutsLoading());
    }
  }

  void getAllWorkouts() {
    if (allworkouts == null) {
      isolate.getAllWorkouts().then((data) {
        allworkouts = data;
        emit(WorkoutsLoaded());
      });
    }
  }

  void getWorkoutsChallenges(UserPersonalInfoGetModel userData) {
    if (challenges == null) {
      workRepo.getWorkoutsChallenges(userData).then((response) {
        if (response != null) {
          challenges = response;
          emit(WorkoutsLoaded());
        } else {
          emit(WorkoutsFialure());
        }
      });
      emit(WorkoutsLoading());
    }
  }

  void selectWorkoutsByLevel(String level) {
    if (data != null && allworkouts != null) {
      if ('Recent' == level) {
        dataLevel = data!;
        emit(WorkoutsSelectLevel());
      } else {
        dataLevel = allworkouts![level]!;
        emit(WorkoutsSelectLevel());
      }
    }
  }

  void showAllChallenges() {
    viewAllChallenge = !viewAllChallenge;
    emit(WorkoutsGetFavorite());
  }
}
