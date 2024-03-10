import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';
import '../../../services/pref.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/custom_snackbar_message.dart';
import '../../../shared/widgets/login_comp/loading_dialog.dart';
import '../../models/user_personal_info_model.dart';
import '../../repository/login_res/user_info_repo.dart';
part 'user_data_info_state.dart';

class UserDataInfoCubit extends Cubit<UserDataInfoState> {
  UserDataInfoCubit() : super(UserDataInfoInitial());
  final userRepo = UserInfoRepo();
  
  void saveUserData({
    required UserPersonalInfoModel info,
    required String token,
    required BuildContext context,
  }) {
    userRepo.sendUserInfo(
      info: info, 
      token: token,
    ).then((response) {
      ScaffoldMessenger.of(context).clearSnackBars();
      if (response != null) {
        if (response.status == 'Success') {
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
  }
}
