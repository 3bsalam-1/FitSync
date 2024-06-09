import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/models/smart_watch_model.dart';
import '../../services/isolate_service.dart';
import '../../services/pref.dart';
import '../../services/smart_watch_services.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/custom_snackbar_message.dart';
part 'smart_watch_state.dart';

class SmartWatchCubit extends Cubit<SmartWatchState> {
  SmartWatchCubit() : super(SmartWatchInitial());

  final watchService = SmartWatchServices();
  final isolate = IsolateService();
  SmartWatchModel? smartWatchData;
  late PermissionStatus isAccept;

  void intializeSmartWatchConnection() {
    watchService.initSmartWatch().then((value) {
      isAccept = value;
      Prefs.setBool("watch-permission", true);
      emit(SmartWatchConnection());
    });
  }

  void isSmartWatchConnected() {
    if (Prefs.getBool("watch-permission") != null) {
      if (Prefs.getBool("watch-permission")!) {
        intializeSmartWatchConnection();
      }
    }
  }

  void isThereData() {
    if (smartWatchData != null) {
      emit(SmartWatchHaveData());
    }
  }

  void getSmartWatchData() async {
    //smartWatchData = await isolate.getSmartWatchDataService();
    smartWatchData = await watchService.getSmartWatchData();
    if (smartWatchData != null) {
      emit(SmartWatchData());
    }
  }
}
