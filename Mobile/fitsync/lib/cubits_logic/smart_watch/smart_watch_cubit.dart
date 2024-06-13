import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_health_connect/flutter_health_connect.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/models/smart_watch_model.dart';
import '../../services/isolate_service.dart';
import '../../services/pref.dart';
import '../../services/smart_watch_services.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/chart_data.dart';
import '../../shared/widgets/global/custom_snackbar_message.dart';
part 'smart_watch_state.dart';

class SmartWatchCubit extends Cubit<SmartWatchState> {
  SmartWatchCubit() : super(SmartWatchInitial());

  final watchService = SmartWatchServices();
  final isolate = IsolateService();
  SmartWatchModel? smartWatchData;
  SmartWatchWeekData? smartWatchWeek;
  late PermissionStatus isAccept;

  void intializeSmartWatchConnection() {
    watchService.initSmartWatch().then((value) async {
      if (!value) {
        await HealthConnectFactory.openHealthConnectSettings();
        value = await watchService.initSmartWatch();
      }
      if (value) {
        Prefs.setBool("watch-permission", value);
        emit(SmartWatchConnection());
        isSmartWatchConnected();
      }
    });
  }

  void isSmartWatchConnected() {
    if (Prefs.getBool("watch-permission") != null) {
      if (Prefs.getBool("watch-permission")!) {
        emit(SmartWatchAlreadyConnected());
      }
    }
  }

  void getSmartWatchData() async {
    if (Prefs.getBool("watch-permission") != null) {
      if (Prefs.getBool("watch-permission")!) {
        smartWatchData = await watchService.getSmartWatchData();
        if (smartWatchData != null) {
          emit(SmartWatchData());
        }
      }
    }
    smartWatchWeek = await showSmartWatchDataWeekly();
    emit(SmartWatchData());
  }
}
