import 'package:workmanager/workmanager.dart';
import 'local_notification_services.dart';
import 'smart_watch_services.dart';

class WorkManagersServices {
  void showHeartRate() async {
    await Workmanager().registerPeriodicTask(
      'HR1',
      'heart rate attack',
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
    // to test it make it heartRate = 50
    if (heartRate <= 50 || heartRate >= 85) {
      await LocalNotificationServices.showAlarmNotification(heartRate);
    }
    return Future.value(true);
  });
}
