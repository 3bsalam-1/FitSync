import 'package:fitsync/data/repository/vital_signal/check_heart_rate.dart';
import 'package:workmanager/workmanager.dart';
import '../data/repository/vital_signal/vital_info.dart';
import '../screens/workouts/workouts_screen.dart';
import 'local_notification_services.dart';
import 'smart_watch_services.dart';

class WorkManagersServices {
  void showHeartRate() async {
    await Workmanager().registerPeriodicTask(
      'HR1',
      'heart rate',
      frequency: const Duration(minutes: 2),
    );
  }

  Future<void> init() async {
    await Workmanager().initialize(
      actionTask,
      // todo replace it into false in realse mode
      isInDebugMode: true,
    );
    showHeartRate();
  }

  void cancelAllTasks() {
    Workmanager().cancelAll();
  }
}

@pragma('vm:entry-point')
void actionTask() {
  Workmanager().executeTask((taskName, inputData) async {
    var heartRate = await SmartWatchServices().getHeartRateData() ?? 75;
    late List<num> heartMeagure;
    if (changeActivity) {
      changeActivity = false;
      heartMeagure = await checkHeartrate();
    }
    heartMeagure.isEmpty ? heartMeagure = [40, 80] : heartMeagure;
    //  if the heart rate very small or is very huge than the normal beats
    if (heartRate < heartMeagure[0] || heartRate > heartMeagure[1]) {
      await LocalNotificationServices.showAlarmNotification(heartRate);
    }
    if (DateTime.now().hour == 0) {
      var steps = await SmartWatchServices().getStepsData() ?? 0;
      var sleep = await SmartWatchServices().getSleepData() ?? 6;
      await saveVitalInfo(
        steps: steps,
        heartRate: heartRate,
        sleep: sleep,
      );
    }
    return Future.value(true);
  });
}
