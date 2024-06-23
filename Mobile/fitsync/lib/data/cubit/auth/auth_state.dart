part of 'auth_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthRegister extends AuthCubitState {}

final class AuthLogin extends AuthCubitState {}

final class AuthFaliure extends AuthCubitState {
  final String message;

  AuthFaliure(this.message);

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

final class AuthSuccess extends AuthCubitState {
  final String message;
  final Color backcontent;
  final String title;
  final IconData icon;

  AuthSuccess({
    required this.message,
    this.backcontent = green,
    this.title = 'Success message',
    this.icon = FontAwesomeIcons.circleCheck,
  });

  void showSucceussdialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context,
        backColor: green,
        icon: FontAwesomeIcons.circleCheck,
        title: 'Success message',
        subTitle: message,
        contentColor: white,
        duration: const Duration(minutes: 1),
      ),
    );
  }
}

final class AuthLoading extends AuthCubitState {
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

final class AuthIsObscure extends AuthCubitState {}

final class AuthForgetPassword extends AuthCubitState {}

final class AuthResetCode extends AuthCubitState {}

final class InternetConnectivityOFF extends AuthCubitState {
  void showConnectionError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: gray10,
        content: customTranslateText(
          "There is no internet connection",
          style: const TextStyle(
            color: white,
          ),
        ),
      ),
    );
  }
}
