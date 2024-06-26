import 'package:intl/intl.dart';
import '../../../../data/models/user_personal_info_model.dart';
import '../../../../services/pref.dart';

class DataInfo {
  final String label;
  final String value;
  final void Function()? onPressed;

  DataInfo({
    required this.label,
    required this.value,
    required this.onPressed,
  });
}

List<DataInfo> getDataInfo(UserPersonalInfoGetModel? data) {
  return [
    DataInfo(
      label: 'Username',
      value: data != null ? Prefs.getStringList('user')![0] : '_',
      onPressed: null,
    ),
    DataInfo(
      label: 'Gender',
      value: data != null
          ? data.gender == 0
              ? 'Male'
              : 'Female'
          : '_',
      onPressed: null,
    ),
    DataInfo(
      label: 'Birth-Date',
      value:
          data != null ? DateFormat('dd/MM/yyyy').format(data.birthdate) : '_',
      onPressed: null,
    ),
    DataInfo(
      label: 'Height',
      value: data != null ? data.height.toString() : '_',
      onPressed: null,
    ),
    DataInfo(
      label: 'Weight',
      value: data != null ? data.weight.toString() : '_',
      onPressed: null,
    ),
    DataInfo(
      label: 'Blood-sugar',
      value: data != null ? data.bloodSugar.toString() : '_',
      onPressed: null,
    ),
    DataInfo(
      label: 'Systolic-blood-pressure',
      value: data != null ? data.systolicBP.toString() : '_',
      onPressed: null,
    ),
    DataInfo(
      label: 'Diastolic-blood-pressure',
      value: data != null ? data.diastolicBP.toString() : '_',
      onPressed: null,
    ),
    DataInfo(
      label: 'Cholesterol-level',
      value: data != null ? data.cholesterolLevel.toString() : '_',
      onPressed: null,
    ),
    DataInfo(
      label: 'Knee-Pain',
      value: data != null
          ? data.kneePain == 0
              ? 'NO'
              : 'YES'
          : '_',
      onPressed: null,
    ),
    DataInfo(
      label: 'Back-Pain',
      value: data != null
          ? data.backPain == 0
              ? 'NO'
              : 'YES'
          : '_',
      onPressed: null,
    ),
  ];
}
