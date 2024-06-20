import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../services/decode_jwt.dart';
import '../../../services/pref.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/custom_snackbar_message.dart';
import '../../../shared/widgets/login_comp/loading_dialog.dart';
import '../../models/user_personal_info_model.dart';
import '../../repository/user/user_info_repo.dart';
part 'user_data_info_state.dart';

class UserDataInfoCubit extends Cubit<UserDataInfoState> {
  UserDataInfoCubit() : super(UserDataInfoInitial());
  final userRepo = UserInfoRepo();
  UserPersonalInfoGetModel? userData;
  var userNameController = TextEditingController();

  void saveUserData({
    required UserPersonalInfoModel info,
    required BuildContext context,
  }) {
    userRepo
        .sendUserInfo(
      info: info,
    )
        .then((response) {
      ScaffoldMessenger.of(context).clearSnackBars();
      if (response != null) {
        if (response.status == 'Success') {
          // The user is take the survey so they will save as login to the app
          Prefs.setBool('isLogin', true);
          emit(UserDataSuccess());
        } else {
          emit(UserDataFailure(response.message!));
        }
      } else {
        emit(UserDataFailure('Something went wrong in the server'));
      }
    });
    emit(UserDataLoading());
  }

  void removeData() {
    Prefs.remove('weight');
    Prefs.remove('height');
    Prefs.remove('gender');
    Prefs.remove('sys');
    Prefs.remove('dias');
    Prefs.remove('chol');
    Prefs.remove('bloodSugare');
    Prefs.remove('bmr');
    Prefs.remove('bp');
    Prefs.remove('theme');
  }

  void getUserDataInfo(BuildContext context) {
    if (userData == null) {
      userRepo.getUserInfo().then((response) {
        if (response == null) {
          emit(UserDataFailure("No internet connection"));
        } else {
          userData = response;
          emit(UserDataSuccess());
        }
      });
      emit(UserDataLoading());
    }
  }

  void updateUserInfo({
    required num weight,
    required num height,
    required String birthdate,
    required int gender,
    required num systolicBP,
    required num diastolicBP,
    required bool kneePain,
    required bool backPain,
    required num cholesterolLevel,
    required num bloodSugar,
  }) {
    userRepo
        .updateUserInfo(
      weight: weight,
      height: height,
      birthdate: birthdate,
      gender: gender,
      systolicBP: systolicBP,
      diastolicBP: diastolicBP,
      kneePain: kneePain,
      backPain: backPain,
      cholesterolLevel: cholesterolLevel,
      bloodSugar: bloodSugar,
    )
        .then((value) async {
      if (value != null) {
        if (value.token != null) {
          await Prefs.setString('token', value.token!);
          userData = UserPersonalInfoGetModel.fromJson(value.data!);
          decodeJWT();
          emit(UserUpdateSuccess());
        }
      }
      emit(UserDataFailure(
          'Can not be updating data something went wrong in server'));
    });
    emit(UserUpdateLoading());
  }

  void usernameValidate() {
    if (userNameController.text.isEmpty) {
      emit(
        UserDataFailure('Please Enter username to be updated'),
      );
    } else {
      // todo here add new api for updating username
    }
  }
}
