import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_health_connect/flutter_health_connect.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/models/smart_watch_model.dart';
import '../../data/models/vital_info_model.dart';
import '../../data/repository/vital_signal/vital_info.dart';
import '../../services/isolate_service.dart';
import '../../services/pref.dart';
import '../../services/smart_watch_services.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/activity_comp/chart_data.dart';
import '../../shared/widgets/global/custom_snackbar_message.dart';
part 'smart_watch_state.dart';

class SmartWatchCubit extends Cubit<SmartWatchState> {
  SmartWatchCubit() : super(SmartWatchInitial()) {
    getSmartWatchData();
  }

  final watchService = SmartWatchServices();
  final isolate = IsolateService();
  SmartWatchModel? smartWatchData;
  SmartWatchWeekData? smartWatchWeek;
  late PermissionStatus isAccept;
  VitalInfoModel? vitalInfodata;
  var glassesGoal = TextEditingController();
  var quantityGoal = TextEditingController();
  var distanceGoal = TextEditingController();
  var sleepGoal = TextEditingController();

  void intializeSmartWatchConnection() {
    watchService.initSmartWatch().then((value) async {
      if (!value) {
        await HealthConnectFactory.openHealthConnectSettings();
        value = await watchService.initSmartWatch();
      }
      if (value) {
        Prefs.setBool("watch-permission", value);
        emit(SmartWatchConnection());
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
        Timer.periodic(
          const Duration(minutes: 2),
          (timer) async {
             smartWatchData = await isolate.getSmartWatchDataService();
          },
        );
        if (smartWatchData != null) {
          emit(SmartWatchData());
        }
      }
    }
    smartWatchWeek = await showSmartWatchDataWeekly();
    emit(SmartWatchData());
  }

  void saveWaterParameters() {
    if (glassesGoal.text.isNotEmpty) {
      Prefs.setDouble(
        "water-glass",
        double.parse(glassesGoal.text),
      );
    }
    if (quantityGoal.text.isNotEmpty) {
      Prefs.setDouble(
        "water-quantity",
        double.parse(quantityGoal.text),
      );
    }
    if (quantityGoal.text.isNotEmpty || glassesGoal.text.isNotEmpty) {
      emit(SmartWatchSaveWaterData());
    }
  }

  void saveDistanceParameters() {
    if (distanceGoal.text.isNotEmpty) {
      Prefs.setDouble(
        "distance-goal",
        double.parse(distanceGoal.text),
      );
      emit(SmartWatchSaveDistanceData());
    }
  }

  void saveSleepParameters() {
    if (sleepGoal.text.isNotEmpty) {
      Prefs.setDouble(
        "sleep-goal",
        double.parse(sleepGoal.text),
      );
      emit(SmartWatchSaveSleepData());
    }
  }

  void callVitalInfo() async {
    vitalInfodata = await getVitalInfo();
    emit(VitalInfoData());
  }
}
