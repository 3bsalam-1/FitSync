import 'package:bloc/bloc.dart';
import 'package:fitsync/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../services/pref.dart';
import '../repository/code_confirm_repo.dart';
import '../repository/password_repo.dart';
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
  CodeConfirmRepo verfiy = CodeConfirmRepo();
  PasswordRepo pass = PasswordRepo();
  List<TextEditingController> opt = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  var autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;
  bool isObscureConfirm = true;

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
          username: username.text,
          email: email.text,
          password: password.text,
          passwordConfirm: confirmPassword.text,
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

  void obscureCheckConfirm() {
    isObscureConfirm = !isObscureConfirm;
    emit(AuthIsObscure());
  }

  void verifyCode() {
    String otpCode = '';
    for (var element in opt) {
      otpCode += element.text;
    }
    if (otpCode.length == 4) {
      verfiy.confirmCodeVerfiy(
        token: Prefs.getString('token')!,
        code: otpCode,
      ).then((response) {
        if (response!.token == null) {
          // will show error massege which there something went wrong
          emit(AuthFaliure(response.message));
        } else {
          // There is no error then go to the home page & save token
          Prefs.setString('token', response.token!);
          // The user is created account so they will save as login to the app
          Prefs.setBool('isLogin', true);
          // The user still no take the survey
          Prefs.setBool('takeSurvey', false);
          emit(AuthSuccess('The Verification Success'));
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
    } else {
      emit(AuthWentWrong('Please write all the code'));
    }
  }

  void forgetPassword() {
    if (email.text.isNotEmpty) {
      pass
          .forgetPassword(
        email: email.text,
      )
          .then((response) {
        if (response!.token == null) {
          // will show error massege which there something went wrong
          emit(AuthFaliure(response.message));
        } else {
          // There is no error then go to the home page & save token
          Prefs.setString('token', response.token!);
          //emit(AuthSuccess(''));
          Future.delayed(
            const Duration(seconds: 1),
            () {
              emit(AuthLogin());
            },
          );
        }
      });
      // show dailog for waiting the process to finish
      emit(AuthLoading());
    } else {
      emit(AuthWentWrong('Please Enter Your Email'));
    }
  }

  void sendPassword() {}
}
