import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
//import '../data/models/smart_watch_model.dart';
import '../data/models/workouts_model.dart';
import '../data/repository/workouts/workouts_repo.dart';
import 'smart_watch_services.dart';

class IsolateService {
  final watchService = SmartWatchServices();
  final workRepo = WorkoutsRepo();

  // Future<SmartWatchModel?> _getSmartWatchDataService(dynamic token) async {
  //   BackgroundIsolateBinaryMessenger.ensureInitialized(token);
  //   final data = await watchService.getSmartWatchData();
  //   return data;
  // }

  // Future<SmartWatchModel?> getSmartWatchDataService() async {
  //   final token = RootIsolateToken.instance;
  //   final data = await compute(_getSmartWatchDataService, token);
  //   return data;
  // }

  Future<Map<String, List<WorkoutsModel>>> _getAllWorkouts(dynamic token) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
    List<WorkoutsModel>? allWorkouts = await workRepo.getAllWorkoutsData();
    List<WorkoutsModel> beginner = [];
    List<WorkoutsModel> intermediate = [];
    List<WorkoutsModel> advanced = [];
    for (var workouts in allWorkouts!) {
      if (workouts.level == 'Beginner') {
        beginner.add(workouts);
      } else if (workouts.level == 'Intermediate') {
        intermediate.add(workouts);
      } else {
        advanced.add(workouts);
      }
    }
    return {
      'Beginner': beginner,
      'Intermediate': intermediate,
      'Advanced': advanced,
    };
  }

  Future<Map<String, List<WorkoutsModel>>> getAllWorkouts() async {
    final token = RootIsolateToken.instance;
    final data = await compute(_getAllWorkouts, token);
    return data;
  }
}
