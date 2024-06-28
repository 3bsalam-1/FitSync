import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import '../../../services/decode_jwt.dart';
import '../../../services/pref.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/const/base_url.dart';
import '../../../shared/widgets/global/custom_snackbar_message.dart';
import '../../models/response_model.dart';
import '../../repository/login_res/user_auth_repo.dart';
import 'package:http/http.dart' as http;
part 'avatar_profile_state.dart';

class AvatarProfileCubit extends Cubit<AvatarProfileState> {
  AvatarProfileCubit() : super(AvatarProfileInitial());
  final picker = ImagePicker();
  final auth = UserAuthRepo();
  File? imageSelected;

  void selectImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageSelected = File(pickedFile.path);
        auth
            .userLogin(
          email: Prefs.getString('email')!,
          password: Prefs.getString('password')!,
        )
            .then((value) {
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
        auth
            .userLogin(
          email: Prefs.getString('email')!,
          password: Prefs.getString('password')!,
        )
            .then((value) {
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

  void saveChangedAvatar(File? selectedImage) async {
    if (selectedImage != null) {
      try {
        var request = http.MultipartRequest(
          "PATCH",
          Uri.parse('$baseUrl/api/user/changeAvatar'),
        );
        request.headers.addAll({
          'Authorization': 'Bearer ${Prefs.getString('token')!}',
          "Content-Type": "multipart/form-data",
          "Accept": "*/*",
        });
        ByteData byteData = selectedImage.readAsBytesSync().buffer.asByteData();
        List<int> imageData = byteData.buffer.asUint8List();
        http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
          'avatar',
          imageData,
          filename: 'profile-avatar',
          contentType: MediaType(
            'image',
            selectedImage.path.split('.').last,
          ),
        );
        request.files.add(multipartFile);
        http.StreamedResponse response = await request.send();
        ResponseModel? data;
        response.stream.transform(utf8.decoder).listen((value) {
          data = ResponseModel.fromJson(jsonDecode(value));
          if (data?.token != null) {
            Prefs.setString('token', data!.token!);
            decodeJWT();
            emit(AvatarUpdateSuccess());
          }
        });
      } catch (e) {
        debugPrint('The changeUserAvatar Errror is: ${e.toString()}');
        emit(AvatarProfileFailure('There is No wi-fi connection'));
      }
      emit(AvatarProfileLoading());
    }
  }
}
