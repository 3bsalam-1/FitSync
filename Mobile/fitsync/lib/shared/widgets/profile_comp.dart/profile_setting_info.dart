import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/models/user_personal_info_model.dart';
import '../../../services/pref.dart';

List<Map<int, String>> userInfoData(
  BuildContext context, 
  UserPersonalInfoGetModel? data,
){
  return [
  {
    0: 'Username',
    1: Prefs.getString('name')?? '',
  },
  {
    0: 'Gender',
    1: data == null? '_': data.gender == 0? 'Male': 'Female',
  },
  {
    0: 'Birth-Date',
    1: data == null? '_': DateFormat('dd/MM/yyyy').format(data.birthdate),
  },
  {
    0: 'Height',
    1:  data == null? '_': '${data.height} cm',
  },
  {
    0: 'Weight',
    1: data == null? '_': '${data.weight} kg',
  },
  {
    0: 'Blood-sugar',
    1: data == null? '_': '${data.bloodSugar} Mg/dL',
  },
  {
    0: 'Systolic-blood-pressure',
    1: data == null? '_': '${data.systolicBP} SYS',
  },
  {
    0: 'Diastolic-blood-pressure',
    1:  data == null? '_': '${data.diastolicBP} DIA',
  },
  {
    0: 'Cholesterol-level',
    1: data == null? '_': '${data.cholesterolLevel} Mg/dL',
  },
  {
    0: 'Knee-Pain',
    1: data == null? '_': data.kneePain == 0? 'NO': 'YES',
  },
  {
    0: 'Back-Pain',
    1: data == null? '_': data.backPain == 0? 'NO': 'YES',
  },
];
} 