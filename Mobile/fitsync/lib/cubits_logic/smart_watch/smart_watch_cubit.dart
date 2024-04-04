import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../services/isolate_service.dart';
import '../../services/smart_watch_services.dart';
part 'smart_watch_state.dart';

class SmartWatchCubit extends Cubit<SmartWatchState> {
  SmartWatchCubit() : super(SmartWatchInitial());

  final watchService = SmartWatchServices();
  final isolate = IsolateService();
  List<double>? heartRates;
  List<double>? caloriesBurned;
  List<double>? bloodOxygen;
  List<double>? steps;
  List<double>? bloodGlucos;
  List<double>? sleep;

  void intializeSmartWatchConnection() {
    watchService.initSmartWatch();
    emit(SmartWatchConnection());
  }

  void getSmartWatchData() async {
    heartRates = await isolate.getHeartRateDataService();
    caloriesBurned = await isolate.getCaloriesDataService();
    bloodOxygen = await isolate.getBloodOxygenDataService();
    bloodGlucos = await isolate.getBloodGlucoseDataService(); // empty data
    sleep = await isolate.getSleepDataService();
    if (heartRates != null) {
      emit(SmartWatchData());
    }
    //steps = await watchService.getStepsData(); // todo need permision
  }
}
