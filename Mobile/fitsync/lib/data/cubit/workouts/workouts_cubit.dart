import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../services/isolate_service.dart';
import '../../models/user_personal_info_model.dart';
import '../../models/workouts_model.dart';
import '../../repository/ai_res/favorite_workouts_repo.dart';
import '../../repository/ai_res/workouts_repo.dart';
part 'workouts_state.dart';

class WorkoutsCubit extends Cubit<WorkoutsState> {
  WorkoutsCubit() : super(WorkoutsInitial());
  final workRepo = WorkoutsRepo();
  final favoriteRepo = FavoriteWorkoutsRepo();
  final isolate = IsolateService();
  List<WorkoutsModel>? data;
  List<WorkoutsModel>? challenges;
  Map<String, List<WorkoutsModel>>? allworkouts;
  List<WorkoutsModel>? favoriteWorkouts;
  List<WorkoutsModel> dataLevel = [];
  bool isFavorite = false;
  bool viewAllFavorites = false;
  bool viewAllChallenge = false;

  void getWorkoutsData(UserPersonalInfoGetModel userData) {
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

  void addWorkoutsToFavorites({
    required WorkoutsModel workouts,
    required String userId,
  }) {
    if (data != null && allworkouts != null) {
      favoriteRepo
          .addWorkoutsToFavorites(
        workouts: workouts,
        userId: userId,
      )
          .then((response) {
        if (response != null) {
          if (response.status == 'Success') {
            isFavoriteWorkouts(workouts);
            emit(WorkoutsAddFavorite());
          }
        } else {
          emit(WorkoutsFialure());
        }
      });
    }
  }

  void getFavoriteWorkouts() {
    favoriteRepo.getWorkoutsFavorites().then((response) {
      favoriteWorkouts = response;
      emit(WorkoutsGetFavorite());
    });
  }

  void isFavoriteWorkouts(WorkoutsModel workouts) {
    for (var element in favoriteWorkouts!) {
      if (element.category.trim() == workouts.category.trim() &&
          element.calBurned.trim() == workouts.calBurned.trim() &&
          element.planDurationMn.trim() == workouts.planDurationMn.trim()) {
        isFavorite = true;
        emit(WorkoutsGetFavorite());
        break;
      }
    }
  }

  void showAllSavedWorkouts() {
    viewAllFavorites = !viewAllFavorites;
    emit(WorkoutsGetFavorite());
  }

  void showAllChallenges() {
    viewAllChallenge = !viewAllChallenge;
    emit(WorkoutsGetFavorite());
  }
}
