import 'dart:async';
import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:fitsync/services/pref.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

late Timer t;

class LocalNotificationServices {
  static var notificationPlugin = FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse details) {
    t.cancel();
  }

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
        "Heart Rate Attack",
        importance: Importance.max,
        priority: Priority.max,
        color: red2,
        ongoing: true,
        showProgress: true,
        sound: RawResourceAndroidNotificationSound(
          'alarm.mp3'.split('.').first,
        ),
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
    t = Timer(
      const Duration(seconds: 30),
      () async {
        // To open phone call
        String? number = Prefs.getString('phone-emergency');
        if (Platform.isAndroid) {
          if (number != null) {
            final AndroidIntent intent = AndroidIntent(
              action: 'android.intent.action.CALL',
              data: 'tel:$number',
            );
            await intent.launch();
          } else {
            // todo here add the emergency phone
            const AndroidIntent intent = AndroidIntent(
              action: 'android.intent.action.CALL',
              data: 'tel:01093384013',
            );
            await intent.launch();
          }
        }
      },
    );
  }

  static Future<void> showNotificationsSchedule() async {
    var details = NotificationDetails(
      android: AndroidNotificationDetails(
        "n.1",
        "Heart Rate",
        sound: RawResourceAndroidNotificationSound(
          'notify.mp3'.split('.').first,
        ),
      ),
    );
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    var currentTime = tz.TZDateTime.now(tz.local);
    var scheduleTime = tz.TZDateTime(
      tz.local,
      currentTime.year, // year
      currentTime.month, // month
      currentTime.day, // day
      23, // hour
      30, // minute
    );
    if (scheduleTime.isBefore(currentTime)) {
      scheduleTime = scheduleTime.add(const Duration(days: 1));
    }
    notificationPlugin.zonedSchedule(
      1,
      "Heart Rate",
      "The current Heart Rate is data",
      scheduleTime,
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static cancelNotifications() {
    notificationPlugin.cancelAll();
  }
}
