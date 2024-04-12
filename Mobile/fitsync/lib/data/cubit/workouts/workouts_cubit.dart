import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/user_personal_info_model.dart';
import '../../models/workouts_model.dart';
import '../../repository/ai_res/favorite_workouts_repo.dart';
import '../../repository/ai_res/workouts_repo.dart';
part 'workouts_state.dart';

class WorkoutsCubit extends Cubit<WorkoutsState> {
  WorkoutsCubit() : super(WorkoutsInitial());
  final workRepo = WorkoutsRepo();
  final favoriteRepo = FavoriteWorkoutsRepo();
  List<WorkoutsModel>? data;
  List<WorkoutsModel>? allworkouts;
  List<WorkoutsModel> dataLevel = [];
  bool isFavorite = false;

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
      workRepo.getAllWorkoutsData().then((response) {
        if (response != null) {
          allworkouts = response;
          emit(WorkoutsLoaded());
        } else {
          emit(WorkoutsFialure());
        }
      });
      emit(WorkoutsLoading());
    }
  }

  void selectDataBasedLevel(String level) {
    if (data != null && allworkouts != null) {
      if ('Recent' == level) {
        dataLevel = data!;
        emit(WorkoutsLoaded());
      } else {
        var result = allworkouts!.where(
          (item) => item.level.toLowerCase() == level.toLowerCase(),
        );
        dataLevel = List.from(result);
        emit(WorkoutsLoaded());
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

  void isFavoriteWorkouts(WorkoutsModel workouts) {
    favoriteRepo.getWorkoutsFavorites().then((response) {
      for (var element in response) {
        if (element.category == workouts.category &&
            element.calBurned == workouts.calBurned &&
            element.planDurationMn == workouts.planDurationMn) {
          isFavorite = true;
          break;
        }
      }
      emit(WorkoutsGetFavorite());
    });
  }
}
