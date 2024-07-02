import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../cubits_logic/global/new_token_cubit.dart';
import '../../models/workouts_model.dart';
import '../../repository/workouts/favorite_workouts_repo.dart';
import '../../repository/login_res/user_auth_repo.dart';
part 'favorite_workouts_state.dart';

class FavoriteWorkoutsCubit extends Cubit<FavoriteWorkoutsState> {
  FavoriteWorkoutsCubit() : super(FavoriteWorkoutsInitial());
  final auth = UserAuthRepo();
  final favoriteRepo = FavoriteWorkoutsRepo();
  List<WorkoutsModel>? favoriteWorkouts;
  bool isFavorite = false;
  bool viewAllFavorites = false;

  void addWorkoutsToFavorites({
    required WorkoutsModel workouts,
    required String userId,
  }) {
    isFavorite = !isFavorite;
    emit(FavoriteWorkoutsAdded());
    NewTokenCubit().getNewToken();
    favoriteRepo.addWorkoutsToFavorites(
      workouts: workouts,
      userId: userId,
    ).then((response) {
      if (response!.status == 'Success') {
        emit(FavoriteWorkoutsAdded());
        emit(FavoriteWorkoutsLoading());
        favoriteRepo.getWorkoutsFavorites().then((response) {
          favoriteWorkouts = response;
          emit(FavoriteWorkoutsGetAll());
        });
      } else {
        emit(FavoriteWorkoutsFaliure());
      }
    });
    emit(FavoriteWorkoutsLoading());
  }

  void getAllFavoriteWorkouts() {
    favoriteRepo.getWorkoutsFavorites().then((response) {
      favoriteWorkouts = response;
      emit(FavoriteWorkoutsGetAll());
    });
    emit(FavoriteWorkoutsLoading());
  }

  void isFavoriteWorkouts(WorkoutsModel workouts) {
    for (var element in favoriteWorkouts!) {
      if (element.toString() == workouts.toString()) {
        isFavorite = true;
        emit(FavoriteWorkoutsGetAll());
        return;
      }
    }
    isFavorite = false;
    emit(FavoriteWorkoutsGetAll());
  }

  void setFavoriteToInitial() {
    isFavorite = false;
    emit(FavoriteWorkoutsInitial());
  }

  void showAllSavedWorkouts() {
    viewAllFavorites = !viewAllFavorites;
    emit(FavoriteWorkoutsGetAll());
  }
}
