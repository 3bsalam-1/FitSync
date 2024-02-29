part of 'auth_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthRegister extends AuthCubitState {}

final class AuthLogin extends AuthCubitState {}

final class AuthFaliure extends AuthCubitState {
  final String message;

  AuthFaliure(this.message);
}

final class AuthSuccess extends AuthCubitState {
  final String message;

  AuthSuccess(this.message);
}
final class AuthWentWrong extends AuthCubitState {
  final String message;

  AuthWentWrong(this.message);
}

final class AuthLoading extends AuthCubitState {}

final class AuthIsObscure extends AuthCubitState {}
