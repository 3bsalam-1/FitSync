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
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => StatusDialog(
        color: red,
        message: message,
        icon: Icons.clear,
      ),
    );
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pop();
      },
    );
  }
}

final class AuthSuccess extends AuthCubitState {
  final String message;

  AuthSuccess(this.message);

  void showSucceussdialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => StatusDialog(
        color: green2,
        message: message,
        icon: Icons.check,
      ),
    );
  }
}

final class AuthWentWrong extends AuthCubitState {
  final String message;

  AuthWentWrong(this.message);
}

final class AuthLoading extends AuthCubitState {
  void showLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => const LoadingDialog(),
    );
  }
}

final class AuthIsObscure extends AuthCubitState {}

final class AuthForgetPassword extends AuthCubitState {}

final class AuthResetCode extends AuthCubitState {}
