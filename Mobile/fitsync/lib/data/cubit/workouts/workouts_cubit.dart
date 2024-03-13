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
  List<WorkoutsModel> dataLevel = [];

  void getWorkoutsData(UserPersonalInfoGetModel userData) {
    if (data == null) {
      workRepo.getWorkoutsData(
        id: int.parse(userData.userId),
        gender: userData.gender,
        kneeP: userData.kneePain,
        backP: userData.backPain,
        diabeties: userData.diabetes,
        heart: userData.heartCondition,
        hyper: userData.hypertension,
      ).then((response) {
        if (response != null) {
          data = response;
          emit(WorkoutsLoaded());
        } else {
          emit(WorkoutsFialure());
        }
      });
      emit(WorkoutsLoading());
    }
  }

  void selectDataBasedLevel(String level) {
    List<WorkoutsModel> store = [];
    if (data != null) {
      if ('Recent' == level) {
        dataLevel = data!;
      } else {
        data!.map((item) {
          if (item.level.toLowerCase() == level.toLowerCase()) {
            store.add(item);
          }
        });
        dataLevel = store;
      }
      emit(WorkoutsInitial());
    }
  }
}
