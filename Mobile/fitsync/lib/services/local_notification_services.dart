import 'dart:async';
import 'dart:io';
import 'package:android_intent_plus/android_intent.dart';
import 'package:fitsync/services/pref.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'smart_watch_services.dart';

late Timer t;

class LocalNotificationServices {
  static var notificationPlugin = FlutterLocalNotificationsPlugin();
  //static final DirectCaller directCaller = DirectCaller();

  static onTap(NotificationResponse details) {
    if (details.payload == 'Heart-Attack') {
      t.cancel();
      
    }
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
        "Heart Rate",
        importance: Importance.max,
        priority: Priority.max,
        color: red2,
        ongoing: true,
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
    t = Timer(
      const Duration(minutes: 1),
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
