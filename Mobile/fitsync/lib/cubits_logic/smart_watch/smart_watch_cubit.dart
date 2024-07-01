import 'package:appcheck/appcheck.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:launch_app_store/launch_app_store.dart';
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

  void intializeSmartWatchConnection() async {
    bool isInstalled = await AppCheck.isAppInstalled(
      'com.google.android.apps.healthdata',
    );
    if (isInstalled) {
      watchService.initSmartWatch().then((value) async {
        Prefs.setBool("watch-permission", value);
        if (value) {
          emit(SmartWatchConnection());
        } else {
          emit(SmartWatchFailureConnection(
            'The App need to be Connected To the Smart Watch',
          ));
        }
      });
    } else {
      LaunchReview.launch(androidAppId: "com.google.android.apps.healthdata");
      emit(SmartWatchFailureConnection(
        'Need To install the health connect app',
      ));
    }
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
        smartWatchData = await isolate.getSmartWatchDataService();
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
