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

final class UserDataSuccess extends UserDataInfoState {}

final class UserDataFailure extends UserDataInfoState {
  final String message;
  UserDataFailure(this.message);

  void showFaliure(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context,
        backColor: red9,
        icon: FontAwesomeIcons.triangleExclamation,
        title: 'Faliure message',
        subTitle: message,
        contentColor: white,
        duration: const Duration(minutes: 1),
      ),
    );
  }
}

final class UserUpdateLoading extends UserDataInfoState {
  void showLoadingDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        elevation: 0,
        duration: const Duration(days: 1),
        backgroundColor: black.withOpacity(0.3),
        content: const LoadingDialog(),
      ),
    );
  }
}

final class UserUpdateSuccess extends UserDataInfoState {
  void showSucceussdialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context, 
        backColor: purple10, 
        icon: FontAwesomeIcons.circleCheck, 
        title: 'Success message',
        subTitle: 'The data was updated successfully',
        contentColor: white, 
        duration: const Duration(minutes: 1),
      ),
    );
  }
}
