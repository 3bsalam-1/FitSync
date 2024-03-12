import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../../data/models/user_personal_info_model.dart';
import '../../../services/pref.dart';

List<Map<int, String>> userInfoData(BuildContext context){
  UserPersonalInfoGetModel? data = context.read<UserDataInfoCubit>().userData;
  return [
  {
    0: 'Username',
    1: Prefs.getString('name')?? '',
  },
  {
    0: 'Gender',
    1: data == null? '': data.gender == 0? 'Male': 'Female',
  },
  {
    0: 'Birth-Date',
    1: data == null? '': DateFormat('dd/MM/yyyy').format(data.birthdate),
  },
  {
    0: 'Height',
    1:  data == null? 'cm': '${data.height} cm',
  },
  {
    0: 'Weight',
    1: data == null? 'kg': '${data.weight} kg',
  },
  {
    0: 'Blood-sugar',
    1: data == null? '0': '${data.bloodSugar} Mg/dL',
  },
  {
    0: 'Systolic-blood-pressure',
    1: data == null? '0': '${data.systolicBP} SYS',
  },
  {
    0: 'Diastolic-blood-pressure',
    1:  data == null? '0': '${data.diastolicBP} DIA',
  },
  {
    0: 'Cholesterol-level',
    1: data == null? '0': '${data.cholesterolLevel} Mg/dL',
  },
  {
    0: 'Knee-Pain',
    1: data == null? '0': data.kneePain == 0? 'NO': 'YES',
  },
  {
    0: 'Back-Pain',
    1: data == null? '0': data.backPain == 0? 'NO': 'YES',
  },
];
} 