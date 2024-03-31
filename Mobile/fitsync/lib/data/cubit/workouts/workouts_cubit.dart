import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/user_personal_info_model.dart';
import '../../models/workouts_model.dart';
import '../../repository/ai_res/workouts_repo.dart';
part 'workouts_state.dart';

class WorkoutsCubit extends Cubit<WorkoutsState> {
  WorkoutsCubit() : super(WorkoutsInitial());
  final workRepo = WorkoutsRepo();
  List<WorkoutsModel>? data;
  List<WorkoutsModel>? allworkouts;
  List<WorkoutsModel> dataLevel = [];

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
}
