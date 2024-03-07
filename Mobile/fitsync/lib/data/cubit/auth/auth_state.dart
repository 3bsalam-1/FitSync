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
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        duration: const Duration(minutes: 2),
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
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        duration: const Duration(minutes: 2),
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

final class AuthLoading extends AuthCubitState {
  void showLoadingDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(days: 1),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.4,
          left: 60,
          right: 60,
        ),
        content: const LoadingDialog(),
      ),
    );
  }
}

final class AuthIsObscure extends AuthCubitState {}

final class AuthForgetPassword extends AuthCubitState {}

final class AuthResetCode extends AuthCubitState {}
