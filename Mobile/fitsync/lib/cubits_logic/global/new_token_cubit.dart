import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/login_res/user_auth_repo.dart';
import '../../services/pref.dart';

class NewTokenCubit extends Cubit<bool> {
  NewTokenCubit() : super(false);
  
  void getNewToken() {
    if (!state) {
      UserAuthRepo().userLogin(
        email: Prefs.getString('email')!,
        password: Prefs.getString('password')!,
      ).then((response) {
        Prefs.setString('token', response!.token!);
        emit(true);
      });
    }
  }
}
