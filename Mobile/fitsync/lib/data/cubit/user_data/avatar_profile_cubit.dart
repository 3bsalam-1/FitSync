import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../services/pref.dart';
import '../../repository/login_res/user_auth_repo.dart';
import '../../repository/user_avatar_repo.dart';
part 'avatar_profile_state.dart';

class AvatarProfileCubit extends Cubit<AvatarProfileState> {
  AvatarProfileCubit() : super(AvatarProfileInitial());
  final avatarRepo = UserAvatarRepo();
  final picker = ImagePicker();
  final auth = UserAuthRepo();
  File? imageSelected;

  void selectImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageSelected = File(pickedFile.path);
        auth.userLogin(
          email: Prefs.getString('email')!,
          password: Prefs.getString('password')!,
        ).then((value) {
          if (value != null) {
            Prefs.setString("token", value.token!);
            saveChangedAvatar(imageSelected);
          }
        });
        emit(AvatarProfileLoading());
      }
    } catch (error) {
      emit(AvatarProfileFailure());
    }
  }

  void selectImageFromCamera() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        imageSelected = File(pickedFile.path);
        auth.userLogin(
          email: Prefs.getString('email')!,
          password: Prefs.getString('password')!,
        ).then((value) {
          if (value != null) {
            Prefs.setString("token", value.token!);
            saveChangedAvatar(imageSelected);
          } 
        });
        emit(AvatarProfileLoading());
      }
    } catch (error) {
      emit(AvatarProfileFailure());
    }
  }

  void saveChangedAvatar(File? selectedImage) {
    if (selectedImage != null) {
      avatarRepo.changeUserAvatar(
        token: Prefs.getString("token")!,
        image: selectedImage,
      ).then((response) {
        if (response!.status != "Error") {
          emit(AvatarProfileSelected(selectedImage));
        } else {
          emit(AvatarProfileFailure());
        }
      });
    } else {
      emit(AvatarProfileFailure());
    }
  }
}
