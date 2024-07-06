import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repository/google_login.dart';
import '../../data/repository/login_res/user_auth_repo.dart';
import '../../services/pref.dart';

class NewTokenCubit extends Cubit<bool> {
  NewTokenCubit() : super(false);
  
  void getNewToken() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.reload();
    if (!state) {
      if (prefs.getBool('google')!) {
        ContinueWithGoogle()
            .continueWithGoogle(
          name: prefs.getString('userName')!,
          email: prefs.getString('email')!,
          avatar: prefs.getString('avatar')!,
        )
            .then(
          (response) {
            if (response != null) {
              prefs.setString('token', response.token!);
              emit(true);
            }
          },
        );
      } else {
        UserAuthRepo()
            .userLogin(
          email: Prefs.getString('email')!,
          password: Prefs.getString('password')!,
        )
            .then(
          (response) {
            if (response != null) {
              Prefs.setString('token', response.token!);
              emit(true);
            }
          },
        );
      }
    }
  }
}
