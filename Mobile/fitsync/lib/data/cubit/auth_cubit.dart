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
        if (response != null) {
          if (response.token == '') {
            // will show error massege which there something went wrong
            emit(AuthFaliure(response.message!));
          } else {
            // There is no error then go to the home page & save token
            Prefs.setString('token', response.token!);
            // The user is created account so they will save as login to the app
            Prefs.setBool('isLogin', true);
            emit(AuthSuccess('Creating your plan'));
            Future.delayed(
              const Duration(seconds: 2),
              () {
                emit(AuthLogin());
              },
            );
          }
        } else {
          emit(AuthWentWrong('Something went wrong in server'));
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
        if (response != null) {
          if (response.token == '') {
          // will show error massege which there something went wrong
          emit(AuthFaliure(response.message!));
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
        } else {
          emit(AuthWentWrong('Something went wrong in server'));
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
    if (otpCode.length == 6) {
      verfiy.confirmCodeVerfiy(
        token: Prefs.getString('token')!,
        code: otpCode,
      ).then((response) {
        if (response != null) {
          if (response.token == '') {
            // will show error massege which there something went wrong
            emit(AuthFaliure(response.message!));
          } else {
            // There is no error then go to the home page & save token
            Prefs.setString('token', response.token!);
            // The user is created account so they will save as login to the app
            Prefs.setBool('isLogin', true);
            // The user still no take the survey
            Prefs.setBool('takeSurvey', false);
            emit(AuthSuccess('The Verification Success'));
            Future.delayed(
              const Duration(seconds: 3),
              () {
                emit(AuthLogin());
              },
            );
          }
        } else {
          emit(AuthWentWrong('Something went wrong in server'));
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
      pass.forgetPassword(
        email: email.text,
      ).then((response) {
        if (response != null) {
          emit(AuthSuccess(response.message!));
          Future.delayed(
            const Duration(seconds: 3),
            () {
              emit(AuthLogin());
            },
          );
        } else {
          emit(AuthWentWrong('Something went wrong in server'));
        }
      });
      // show dailog for waiting the process to finish
      emit(AuthLoading());
    } else {
      emit(AuthWentWrong('Please Enter Your Email'));
    }
  }
  
  void sendCodeAgain() {
    verfiy.sendCodeToVerfiy(
      token: Prefs.getString('token')!,
    ).then((response) {
      if (response != null) {
        emit(AuthSuccess(response.message!));
      } else {
        emit(AuthWentWrong('Something went wrong in server'));
      }
    });
    // show dailog for waiting the process to finish
    emit(AuthLoading());
  }
  
  void resetCode() {
    String otpCode = '';
    for (var element in opt) {
      otpCode += element.text;
    }
    if (otpCode.length == 6) {
      verfiy.codeReset(
        code: otpCode,
      ).then((response){
        if (response != null) {
          if (response.token == '') {
            // will show error massege which there something went wrong
            emit(AuthFaliure(response.message!));
          } else {
            // There is no error then go to the home page & save token
            Prefs.setString('token', response.token!);
            emit(AuthSuccess('The Verification Success'));
            Future.delayed(
              const Duration(seconds: 3),
              () {
                emit(AuthLogin());
              },
            );
          }
        } else {
          emit(AuthWentWrong('Something went wrong in server'));
        }
      });
      emit(AuthLoading());
    }
  }

  void resetPassword() {
    if (keyValidate.currentState!.validate()) {
      pass.resetPassword(
        password: password.text, 
        passwordConfirm: confirmPassword.text, 
        token: Prefs.getString('token')!,
      ).then((response){
        if (response != null) {
          if (response.token == '') {
            // will show error massege which there something went wrong
            emit(AuthFaliure(response.message!));
          } else {
            // There is no error then go to the home page & save token
            Prefs.setString('token', response.token!);
            // The user is created account so they will save as login to the app
            Prefs.setBool('isLogin', true);
            emit(AuthSuccess('The updating password Success'));
            Future.delayed(
              const Duration(seconds: 3),
              () {
                emit(AuthLogin());
              },
            );
          }
        } else {
          emit(AuthWentWrong('Something went wrong in server'));
        }
      });
      emit(AuthLoading());
    }
  }
}
