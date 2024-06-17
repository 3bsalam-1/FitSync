import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/local_notification_services.dart';
import '../../services/pref.dart';

class NotificationCubit extends Cubit<bool> {
  NotificationCubit() : super(false);

  void initNotifications() async {
    await LocalNotificationServices.init();
  }

  void cancelNotifications() {
    LocalNotificationServices.cancelNotifications();
    Prefs.setBool('notifications', false);
  }

  void setNotifications(bool value) {
    Prefs.setBool('notifications', value);
    emit(value);
  }
}
