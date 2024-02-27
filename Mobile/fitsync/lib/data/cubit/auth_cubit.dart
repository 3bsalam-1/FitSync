import 'package:bloc/bloc.dart';
import 'package:fitsync/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../shared/pref.dart';
import '../repository/user_auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var username = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  final keyValidate = GlobalKey<FormState>();
  UserAuthRepo auth = UserAuthRepo();
  var autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;

  void signin() {
    autovalidateMode = AutovalidateMode.always;
    emit(AuthCubitInitial());
    if (keyValidate.currentState!.validate()) {
      auth.userLogin(
        email: email.text,
        password: password.text,
      ).then((response) {
        if (response!.token == null) {
          // will show error massege which there something went wrong
          emit(AuthFaliure(response.message));
        } else {
          // There is no error then go to the home page & save token
          Prefs.setString('token', response.token!);
          emit(AuthSuccess('Creating your plan'));
          Future.delayed(
            const Duration(seconds: 2),
            () {
              emit(AuthLogin());
            },
          );
        }
      });
      // show dailog for waiting the process to finish
      emit(AuthLoading());
    }
  }

  void register() {
    autovalidateMode = AutovalidateMode.always;
    emit(AuthCubitInitial());
    if (keyValidate.currentState!.validate()) {
      auth.userRegister(
        userData: UserDataModel(
          firstName: firstName.text,
          lastName: lastName.text,
          username: 'nadaTarek',//,username.text,
          email: email.text,
          password: password.text,
          passwordConfirm: password.text,
        ),
      ).then((response) {
        if (response!.token == null) {
          // will show error massege which there something went wrong
          emit(AuthFaliure(response.message));
        } else {
          // There is no error then go to the home page & save token
          Prefs.setString('token', response.token!);
          emit(AuthSuccess('Creating your plan'));
          Future.delayed(
            const Duration(seconds: 2),
            () {
              emit(AuthRegister());
            },
          );
        }
      });
      // show dailog for waiting the process to finish
      emit(AuthLoading());
    }
  }

  void obscureCheck() {
    isObscure = !isObscure;
    emit(AuthIsObscure());
  }

  void forgetPassword() {}
}
