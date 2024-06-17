import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/local_notification_services.dart';
import '../../services/pref.dart';
import '../../services/work_manager_services.dart';

class NotificationCubit extends Cubit<bool> {
  NotificationCubit() : super(false);

  void initNotifications() {
    LocalNotificationServices.init();
    WorkManagersServices().init();
    checkNotifications();
  }

  void cancelNotifications() {
    LocalNotificationServices.cancelNotifications();
    WorkManagersServices().cancelAllTasks();
    Prefs.setBool('notifications', false);
    checkNotifications();
  }

  void checkNotifications() {
    if (Prefs.getBool('notifications') != null) {
      emit(Prefs.getBool('notifications')!);
    } else {
      emit(false);
    }
  }
}
