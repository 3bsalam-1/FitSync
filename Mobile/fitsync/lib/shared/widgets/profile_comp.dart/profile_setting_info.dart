import '../../pref.dart';

List<Map<int, String>> userInfo = [
  {
    0: 'Username',
    1: Prefs.getString('name'),
  },
  {
    0: 'Gender',
    1: Prefs.getString('gender'),
  },
  {
    0: 'Birth-Date',
    1: '20/06/2001',
  },
  {
    0: 'Height',
    1: '${Prefs.getString('tall')} cm',
  },
  {
    0: 'Weight',
    1: Prefs.getString('weight'),
  },
  {
    0: 'Blood-sugar',
    1: Prefs.getString('bloodSugar'),
  },
  {
    0: 'Systolic-blood-pressure',
    1: Prefs.getString('systolic'),
  },
  {
    0: 'Diastolic-blood-pressure',
    1:  Prefs.getString('diastolic'),
  },
  {
    0: 'Cholesterol-level',
    1: Prefs.getString('chole'),
  },
  {
    0: 'Knee-Pain',
    1: Prefs.getString('knee'),
  },
  {
    0: 'Back-Pain',
    1: Prefs.getString('back'),
  },
];