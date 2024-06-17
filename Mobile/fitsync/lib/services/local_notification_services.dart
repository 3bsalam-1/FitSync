import 'package:fitsync/services/pref.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'smart_watch_services.dart';

class LocalNotificationServices {
  static var notificationPlugin = FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse details) {}

  static Future<void> init() async {
    bool? acceptNotifications = await notificationPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    if (acceptNotifications != null) {
      Prefs.setBool('notifications', acceptNotifications);
    }
    var settings = const InitializationSettings(
      android: AndroidInitializationSettings('mipmap/ic_launcher'),
    );
    await notificationPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static Future<void> showAlarmNotification(num heartRate) async {
    var details = NotificationDetails(
      android: AndroidNotificationDetails(
        "n.1",
        "Heart Rate",
        importance: Importance.max,
        priority: Priority.max,
        color: red2,
        showProgress: true,
        sound:
            RawResourceAndroidNotificationSound('alarm.mp3'.split('.').first),
      ),
    );
    await notificationPlugin.show(
      0,
      "Dangerous Heart Attack!!",
      "The current Heart Rate is $heartRate Please call the Emergency",
      details,
      payload: "Heart-Attack",
    );
    // todo here make it leas if need to test it
    Future.delayed(
      const Duration(minutes: 4),
      () {
        // todo here add url lancher to make phone call
        print('ffffffffffffffffffdsfdsfsdfdsfdsfffffffffffffffff');
      },
    );
  }

  static Future<void> showNotificationsSchedule() async {
    var details = NotificationDetails(
      android: AndroidNotificationDetails(
        "n.1",
        "Heart Rate",
        sound:
            RawResourceAndroidNotificationSound('notify.mp3'.split('.').first),
      ),
    );
    var heartRate = await SmartWatchServices().getHeartRateData() ?? 75;
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    DateTime timeNow = DateTime.now();
    notificationPlugin.zonedSchedule(
      1,
      "Heart Rate",
      "The current Heart Rate is $heartRate",
      tz.TZDateTime(
        tz.local,
        timeNow.year, // year
        timeNow.month, // month
        timeNow.day, // day
        3, // hour
        0, // minute
      ),
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static cancelNotifications() {
    notificationPlugin.cancelAll();
  }
}
