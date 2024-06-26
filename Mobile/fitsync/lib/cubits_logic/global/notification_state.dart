part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationStateInitial extends NotificationState {}

final class NotificationDenied extends NotificationState {
  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context,
        backColor: yellow2,
        icon: Icons.warning_rounded,
        title: 'Warning message',
        subTitle: 'If you denied, We can not send you notifications',
        contentColor: black,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

final class NotificationChange extends NotificationState {}