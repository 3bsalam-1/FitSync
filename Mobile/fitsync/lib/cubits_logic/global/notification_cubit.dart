import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../services/local_notification_services.dart';
import '../../services/pref.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/custom_snackbar_message.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationStateInitial());
  bool data = Prefs.getBool('notifications') ?? false;

  void initNotifications(bool value) async {
    await LocalNotificationServices.init();
    bool isDenied = await Permission.notification.isDenied;
    if (isDenied) {
      var permission = await Permission.notification.request();
      if (permission.isGranted) {
        changeNotifications(value);
      } else {
        Prefs.setBool('notifications', false);
        emit(NotificationDenied());
      }
    } else {
      changeNotifications(value);
    }
  }

  void changeNotifications(bool value) async {
    Prefs.setBool('notifications', value);
    data = Prefs.getBool('notifications')!;
    emit(NotificationChange());
  }
}
