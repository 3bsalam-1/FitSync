import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/models/smart_watch_model.dart';
import '../../services/isolate_service.dart';
import '../../services/smart_watch_services.dart';
part 'smart_watch_state.dart';

class SmartWatchCubit extends Cubit<SmartWatchState> {
  SmartWatchCubit() : super(SmartWatchInitial());

  final watchService = SmartWatchServices();
  final isolate = IsolateService();
  SmartWatchModel? smartWatchData;
  late PermissionStatus isAccept;

  void intializeSmartWatchConnection() async {
    isAccept = await watchService.initSmartWatch();
    emit(SmartWatchConnection());
  }

  void getSmartWatchData() async {
    if (isAccept.isGranted) {
      smartWatchData = await isolate.getSmartWatchDataService();
      if (smartWatchData != null) {
        emit(SmartWatchData());
      }
    }
  }
}
