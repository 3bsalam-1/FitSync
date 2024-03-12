class UserPersonalInfoModel {
  final num weight;
  final num height;
  final String birthdate;
  final int gender;
  final int activityLevel;
  final num systolicBP;
  final num diastolicBP;
  final num cholesterolLevel;
  final num bloodSugar;
  final bool hypertension;
  final bool diabetes;
  final bool heartCondition;
  final num lowPressure;
  final num bmr;
  final bool kneePain;
  final bool backPain;
  final bool vegetarian;

  UserPersonalInfoModel({
    required this.weight,
    required this.height,
    required this.birthdate,
    required this.gender,
    required this.activityLevel,
    required this.systolicBP,
    required this.diastolicBP,
    required this.cholesterolLevel,
    required this.bloodSugar,
    required this.hypertension,
    required this.diabetes,
    required this.heartCondition,
    required this.lowPressure,
    required this.bmr,
    required this.kneePain,
    required this.backPain,
    required this.vegetarian,
  });
}

class UserPersonalInfoGetModel {
  final String userId;
  final num weight;
  final num height;
  final DateTime birthdate;
  final int gender;
  final int activityLevel;
  final num systolicBP;
  final num diastolicBP;
  final num cholesterolLevel;
  final num bloodSugar;
  final int hypertension;
  final int diabetes;
  final int heartCondition;
  final num lowPressure;
  final num bmr;
  final int kneePain;
  final int backPain;

  UserPersonalInfoGetModel({
    required this.userId,
    required this.weight,
    required this.height,
    required this.birthdate,
    required this.gender,
    required this.activityLevel,
    required this.systolicBP,
    required this.diastolicBP,
    required this.cholesterolLevel,
    required this.bloodSugar,
    required this.hypertension,
    required this.diabetes,
    required this.heartCondition,
    required this.lowPressure,
    required this.bmr,
    required this.kneePain,
    required this.backPain,
  });

  factory UserPersonalInfoGetModel.fromJson(Map<String, dynamic> json) {
    return UserPersonalInfoGetModel(
      userId: json['data']['userInfo']['userId'],
      weight: json['data']['userInfo']['weight'],
      height: json['data']['userInfo']['height'],
      birthdate: DateTime.parse(json['data']['userInfo']['birthdate']),
      gender: json['data']['userInfo']['gender'],
      activityLevel: json['data']['userInfo']['activityLevel'],
      systolicBP: json['data']['userInfo']['systolicBP'],
      diastolicBP: json['data']['userInfo']['diastolicBP'],
      cholesterolLevel: json['data']['userInfo']['cholesterolLevel'],
      bloodSugar: json['data']['userInfo']['bloodsugar'],
      hypertension: json['data']['userInfo']['hypertension'],
      diabetes: json['data']['userInfo']['diabetes'],
      heartCondition: json['data']['userInfo']['heartCondition'],
      lowPressure: json['data']['userInfo']['LowPressure'],
      bmr: json['data']['userInfo']['BMR'],
      kneePain: json['data']['userInfo']['kneePain'],
      backPain: json['data']['userInfo']['backPain'],
    );
  }
}
