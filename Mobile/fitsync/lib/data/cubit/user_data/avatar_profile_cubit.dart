import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../../services/pref.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/custom_snackbar_message.dart';
import '../../repository/login_res/user_auth_repo.dart';
import '../../repository/user/user_avatar_repo.dart';
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
      emit(AvatarProfileFailure(error.toString()));
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
      emit(AvatarProfileFailure(error.toString()));
    }
  }

  void saveChangedAvatar(File? selectedImage) {
    if (selectedImage != null) {
      avatarRepo.changeUserAvatar(
        token: Prefs.getString("token")!,
        image: selectedImage,
      ).then((response) {
        if (response != null) {
          if (response.status != "Error") {
            emit(AvatarProfileSelected(selectedImage));
            emit(AvatarUpdateSuccess());
          } else {
            
            emit(AvatarProfileFailure(response.message!));
          }
        } else {
          emit(AvatarProfileFailure('There is No wi-fi connection'));
        }
      });
      emit(AvatarProfileLoading());
    }
  }
}
