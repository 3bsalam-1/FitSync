import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../services/smart_watch_services.dart';
part 'smart_watch_state.dart';

class SmartWatchCubit extends Cubit<SmartWatchState> {
  SmartWatchCubit() : super(SmartWatchInitial());

  final watchService = SmartWatchServices();
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
    heartRates = await watchService.getHeartRateData();
    caloriesBurned = await watchService.getCaloriesData();
    bloodOxygen = await watchService.getBloodOxygenData();
    bloodGlucos = await watchService.getBloodGlucoseData(); // empty data
    sleep = await watchService.getSleepData();
    steps = await watchService.getStepsData(); // todo need permision
    emit(SmartWatchData());
  }
}
