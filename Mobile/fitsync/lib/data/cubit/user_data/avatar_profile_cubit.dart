import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../../services/pref.dart';
import '../../repository/user_avatar_repo.dart';
part 'avatar_profile_state.dart';

class AvatarProfileCubit extends Cubit<AvatarProfileState> {
  AvatarProfileCubit() : super(AvatarProfileInitial());
  final avatarRepo = UserAvatarRepo();
  final picker = ImagePicker();
  File? imageSelected;

  void selectImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      
      if (pickedFile != null) {
        imageSelected = File(pickedFile.path);
        emit(AvatarProfileSelected(imageSelected));
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
        emit(AvatarProfileSelected(imageSelected));
      }
    } catch (error) {
      emit(AvatarProfileFailure());
    }
  }

  void saveChangedAvatar(dynamic selectedImage) {
    avatarRepo.changeUserAvatar(
      token: Prefs.getString('token')!,
      image: selectedImage,
    ).then((response) {
      print('threjthrjhre $response');
      emit(AvatarProfileSelected(selectedImage));
    });
  }
}
