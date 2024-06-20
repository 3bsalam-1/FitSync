import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fitsync/data/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../services/pref.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/custom_snackbar_message.dart';
import '../../../shared/widgets/login_comp/loading_dialog.dart';
import '../../repository/login_res/code_confirm_repo.dart';
import '../../repository/login_res/password_repo.dart';
import '../../repository/login_res/user_auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var username = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var keyValidateSignin = GlobalKey<FormState>();
  var keyValidateSignup = GlobalKey<FormState>();
  var keyValidatePass = GlobalKey<FormState>();
  bool agreePolicy = false;
  int agreeCheck = -1;
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
  Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  Future<bool> isInternetConnectivityON() async {
    var data = await connectivity.checkConnectivity();
    if (data.last == ConnectivityResult.mobile ||
        data.last == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  void checkAgreePolicy() {
    agreePolicy = !agreePolicy;
    if (agreeCheck != -1) {
      agreeCheck = agreePolicy ? 1 : 0;
    }
    emit(AuthCubitInitial());
  }

  void signin(BuildContext context) async {
    autovalidateMode = AutovalidateMode.always;
    emit(AuthCubitInitial());
    if (keyValidateSignin.currentState!.validate()) {
      bool checkWifi = await isInternetConnectivityON();
      if (checkWifi) {
        auth
            .userLogin(
          email: email.text,
          password: password.text,
        )
            .then((response) {
          ScaffoldMessenger.of(context).clearSnackBars();
          if (response != null) {
            if (response.token == '') {
              // will show error massege which there something went wrong
              emit(AuthFaliure(response.message!));
            } else {
              // There is no error then go to the home page & save token
              Prefs.setString('token', response.token!);
              Prefs.setString('email', email.text);
              Prefs.setString('password', password.text);
              emit(AuthSuccess('Login Successfully'));
              Future.delayed(
                const Duration(seconds: 3),
                () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  emit(AuthLogin());
                },
              );
            }
          } else {
            emit(AuthFaliure('Something went wrong in server'));
          }
        });
        // show dailog for waiting the process to finish
        emit(AuthLoading());
      } else {
        emit(InternetConnectivityOFF());
      }
    }
  }

  void register(BuildContext context) async {
    autovalidateMode = AutovalidateMode.always;
    emit(AuthCubitInitial());
    if (keyValidateSignup.currentState!.validate() && agreePolicy) {
      bool checkWifi = await isInternetConnectivityON();
      if (checkWifi) {
        auth
            .userRegister(
          userData: UserDataModel(
            firstName: firstName.text,
            lastName: lastName.text,
            username: username.text,
            email: email.text,
            password: password.text,
            passwordConfirm: confirmPassword.text,
          ),
        )
            .then((response) {
          ScaffoldMessenger.of(context).clearSnackBars();
          if (response != null) {
            if (response.token == '') {
              // will show error massege which there something went wrong
              emit(AuthFaliure(response.message!));
            } else {
              // There is no error then go to the home page & save token
              Prefs.setString('token', response.token!);
              Prefs.setString('email', email.text);
              Prefs.setString('password', password.text);
              emit(AuthSuccess('The code has sent to your email'));
              Future.delayed(
                const Duration(seconds: 3),
                () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  emit(AuthRegister());
                },
              );
            }
          } else {
            emit(AuthFaliure('Something went wrong in server'));
          }
        });
        // show dailog for waiting the process to finish
        emit(AuthLoading());
      } else {
        emit(InternetConnectivityOFF());
      }
    } else {
      agreeCheck = 0;
      emit(AuthCubitInitial());
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

  void verifyCode(BuildContext context) async {
    String otpCode = '';
    for (var element in opt) {
      otpCode += element.text;
    }
    if (otpCode.length == 6) {
      bool checkWifi = await isInternetConnectivityON();
      if (checkWifi) {
        verfiy
            .confirmCodeVerfiy(
          token: Prefs.getString('token')!,
          code: otpCode,
        )
            .then((response) {
          ScaffoldMessenger.of(context).clearSnackBars();
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
                  ScaffoldMessenger.of(context).clearSnackBars();
                  for (var item in opt) {
                    item.clear();
                  }
                  emit(AuthLogin());
                },
              );
            }
          } else {
            emit(AuthFaliure('Something went wrong in server'));
          }
        });
        // show dailog for waiting the process to finish
        emit(AuthLoading());
      } else {
        emit(InternetConnectivityOFF());
      }
    } else {
      emit(AuthFaliure('Please write all the code'));
    }
  }

  void forgetPassword(BuildContext context) async {
    if (email.text.isNotEmpty) {
      bool checkWifi = await isInternetConnectivityON();
      if (checkWifi) {
        pass
            .forgetPassword(
          email: email.text,
        )
            .then((response) {
          ScaffoldMessenger.of(context).clearSnackBars();
          if (response != null) {
            if (response.status! == 'Error') {
              emit(AuthFaliure(response.message!));
            } else {
              emit(AuthSuccess(response.message!));
              Future.delayed(
                const Duration(seconds: 3),
                () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  emit(AuthForgetPassword());
                },
              );
            }
          } else {
            emit(AuthFaliure('Something went wrong in server'));
          }
        });
        // show dailog for waiting the process to finish
        emit(AuthLoading());
      } else {
        emit(InternetConnectivityOFF());
      }
    } else {
      emit(AuthFaliure('Please Enter Your Email'));
    }
  }

  void sendCodeAgain(BuildContext context) async {
    bool checkWifi = await isInternetConnectivityON();
    if (checkWifi) {
      verfiy
          .sendCodeToVerfiy(
        token: Prefs.getString('token')!,
      )
          .then((response) {
        ScaffoldMessenger.of(context).clearSnackBars();
        if (response != null) {
          emit(AuthSuccess(response.message!));
        } else {
          emit(AuthFaliure('Something went wrong in server'));
        }
      });
      // show dailog for waiting the process to finish
      emit(AuthLoading());
    } else {
      emit(InternetConnectivityOFF());
    }
  }

  void resetCode(BuildContext context) async {
    String otpCode = '';
    for (var element in opt) {
      otpCode += element.text;
    }
    if (otpCode.length == 6) {
      bool checkWifi = await isInternetConnectivityON();
      if (checkWifi) {
        verfiy
            .codeReset(
          code: otpCode,
        )
            .then((response) {
          ScaffoldMessenger.of(context).clearSnackBars();
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
                  ScaffoldMessenger.of(context).clearSnackBars();
                  for (var item in opt) {
                    item.clear();
                  }
                  emit(AuthResetCode());
                },
              );
            }
          } else {
            emit(AuthFaliure('Something went wrong in server'));
          }
        });
        emit(AuthLoading());
      } else {
        emit(InternetConnectivityOFF());
      }
    } else {
      emit(AuthFaliure('Please write all the code'));
    }
  }

  void resetPassword(BuildContext context) async {
    if (keyValidatePass.currentState!.validate()) {
      bool checkWifi = await isInternetConnectivityON();
      if (checkWifi) {
        pass
            .resetPassword(
          password: password.text,
          passwordConfirm: confirmPassword.text,
          token: Prefs.getString('token')!,
        )
            .then((response) {
          ScaffoldMessenger.of(context).clearSnackBars();
          if (response != null) {
            if (response.token == '') {
              // will show error massege which there something went wrong
              emit(AuthFaliure(response.message!));
            } else {
              // There is no error then go to the home page & save token
              Prefs.setString('token', response.token!);
              emit(AuthSuccess('The updating password Success'));
              Future.delayed(
                const Duration(seconds: 3),
                () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  emit(AuthLogin());
                },
              );
            }
          } else {
            emit(AuthFaliure('Something went wrong in server'));
          }
        });
        emit(AuthLoading());
      } else {
        emit(InternetConnectivityOFF());
      }
    }
  }
}
