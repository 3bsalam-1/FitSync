import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/user_personal_info_model.dart';
import '../../repository/login_res/user_info_repo.dart';
part 'user_data_info_state.dart';

class UserDataInfoCubit extends Cubit<UserDataInfoState> {
  UserDataInfoCubit() : super(UserDataInfoInitial());
  final userRepo = UserInfoRepo();
  
  void saveUserData({
    required UserPersonalInfoModel info,
    required String token,
  }) {
    userRepo.sendUserInfo(
      info: info, 
      token: token,
    ).then((response) {
      if (response != null) {
        print('the response is: $response');
        // todo here 
      } else {
        emit(UserDataFailure('Something went wrong in the server'));
      }
    });
  }
}
