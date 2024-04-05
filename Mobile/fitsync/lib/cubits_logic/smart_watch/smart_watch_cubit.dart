import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/smart_watch_model.dart';
import '../../services/isolate_service.dart';
import '../../services/smart_watch_services.dart';
part 'smart_watch_state.dart';

class SmartWatchCubit extends Cubit<SmartWatchState> {
  SmartWatchCubit() : super(SmartWatchInitial());

  final watchService = SmartWatchServices();
  final isolate = IsolateService();
  SmartWatchModel? smartWatchData;

  void intializeSmartWatchConnection() {
    watchService.initSmartWatch();
    emit(SmartWatchConnection());
  }

  void getSmartWatchData() async {
    smartWatchData = await isolate.getSmartWatchDataService();
    if (smartWatchData != null) {
      emit(SmartWatchData());
    }
  }
}
