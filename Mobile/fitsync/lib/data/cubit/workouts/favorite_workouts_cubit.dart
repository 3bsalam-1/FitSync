import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../services/pref.dart';
import '../../models/workouts_model.dart';
import '../../repository/ai_res/favorite_workouts_repo.dart';
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
    isFavorite = true;
    emit(FavoriteWorkoutsAdded());
    auth.userLogin(
      email: Prefs.getString("email")!,
      password: Prefs.getString("password")!,
    ).then((value) {
      favoriteRepo.addWorkoutsToFavorites(
        workouts: workouts,
        userId: userId,
      ).then((response) {
        if (response!.status == 'Success') {
          getAllFavoriteWorkouts();
          emit(FavoriteWorkoutsAdded());
        } else {
          emit(FavoriteWorkoutsFaliure());
        }
      });
    });
  }

  void getAllFavoriteWorkouts() {
    favoriteRepo.getWorkoutsFavorites().then((response) {
      favoriteWorkouts = response;
      emit(FavoriteWorkoutsGetAll());
    });
  }

  void isFavoriteWorkouts(WorkoutsModel workouts) {
    for (var element in favoriteWorkouts!) {
      if (element.toString() == workouts.toString()) {
        isFavorite = true;
        emit(FavoriteWorkoutsGetAll());
        break;
      }
    }
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
