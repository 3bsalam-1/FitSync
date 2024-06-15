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
