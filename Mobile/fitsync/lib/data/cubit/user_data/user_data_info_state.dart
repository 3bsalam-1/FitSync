part of 'user_data_info_cubit.dart';

@immutable
sealed class UserDataInfoState {}

final class UserDataInfoInitial extends UserDataInfoState {}

final class UserDataLoading extends UserDataInfoState {
  void showLoadingDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        elevation: 0,
        duration: const Duration(days: 1),
        backgroundColor: black.withOpacity(0.2),
        content: const LoadingDialog(),
      ),
    );
  }
}

final class UserDataLoaded extends UserDataInfoState {
  final String message;
  UserDataLoaded(this.message);

  void showSucceussdialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        elevation: 0,
        duration: const Duration(minutes: 1),
        backgroundColor: black.withOpacity(0.3),
        content: CustomSnackbarMessage(
          title: 'Success message',
          subTitle: message,
          backColor: green3,
          icon: Icons.check,
        ),
      ),
    );
  }
}

final class UserDataFailure extends UserDataInfoState {
  final String message;
  UserDataFailure(this.message);

  void showFaliure(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        elevation: 0,
        duration: const Duration(minutes: 1),
        backgroundColor: black.withOpacity(0.3),
        content: CustomSnackbarMessage(
          title: 'Faliure message',
          subTitle: message,
          backColor: red9,
          icon: FontAwesomeIcons.triangleExclamation,
        ),
      ),
    );
  }
}
