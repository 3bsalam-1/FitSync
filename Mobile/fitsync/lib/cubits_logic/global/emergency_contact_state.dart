part of 'emergency_contact_cubit.dart';

@immutable
sealed class EmergencyContactState {}

final class EmergencyContactInitial extends EmergencyContactState {}

final class SaveEmergencyContact extends EmergencyContactState {
  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context,
        backColor: purple10,
        icon: Icons.info,
        title: 'Info message',
        subTitle: 'Phone number was Saved succefully',
        contentColor: white,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

final class EmptyEmergencyContact extends EmergencyContactState {
  final String message;
  EmptyEmergencyContact(this.message);

  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context,
        backColor: red9,
        icon: Icons.warning_rounded,
        title: 'Faliure message',
        subTitle: message,
        contentColor: white,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

final class PermissionDeniedEmergencyContact extends EmergencyContactState {
  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context,
        backColor: yellow2,
        icon: Icons.warning_rounded,
        title: 'Warning message',
        subTitle: 'Can not save phone number The Permission was Denied',
        contentColor: black,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
