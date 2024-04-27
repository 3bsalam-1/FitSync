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

final class AuthSuccess extends AuthCubitState {
  final String message;

  AuthSuccess(this.message);

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
          backColor: green4,
          icon: FontAwesomeIcons.circleCheck,
        ),
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
