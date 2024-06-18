import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../services/pref.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/custom_snackbar_message.dart';
part 'emergency_contact_state.dart';

class EmergencyContactCubit extends Cubit<EmergencyContactState> {
  EmergencyContactCubit() : super(EmergencyContactInitial());
  var phone = TextEditingController();

  void savePhoneNumber() async {
    if (phone.text.isNotEmpty) {
      var permission = await Permission.phone.request();
      if (permission.isGranted) {
        Prefs.setString('phone-emergency', phone.text);
        emit(SaveEmergencyContact());
      } else {
        emit(PermissionDeniedEmergencyContact());
      }
    } else {
      emit(EmptyEmergencyContact());
    }
  }
}
