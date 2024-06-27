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
  final bool isActive;

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
    required this.isActive,
  });

  factory UserPersonalInfoGetModel.fromJson(Map<String, dynamic> json) {
    return UserPersonalInfoGetModel(
      userId: json['data']['diseases']['userId'],
      weight: json['data']['weight'],
      height: json['data']['height'],
      birthdate: DateTime.parse(json['data']['birthdate']),
      gender: json['data']['gender'],
      activityLevel: json['data']['activityLevel'],
      systolicBP: json['data']['systolicBP'],
      diastolicBP: json['data']['diastolicBP'],
      cholesterolLevel: json['data']['cholesterolLevel'],
      bloodSugar: json['data']['bloodsugar'],
      hypertension: json['data']['diseases']['hypertension'],
      diabetes: json['data']['diseases']['diabetes'],
      heartCondition: json['data']['diseases']['heartCondition'],
      lowPressure: json['data']['diseases']['LowPressure'],
      bmr: json['data']['BMR'],
      kneePain: json['data']['diseases']['kneePain'],
      backPain: json['data']['diseases']['backPain'],
      isActive: json['data']['isActive'],
    );
  }
}
