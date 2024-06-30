class UserPersonalInfoModel {
  final num weight;
  final num height;
  final int age;
  final String gender;
  final String activityLevel;
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
    required this.age, 
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

  factory UserPersonalInfoModel.fromJson(Map<String, dynamic> json) => UserPersonalInfoModel(
    weight: json['weight'], 
    height: json['height'], 
    age: json['age'], 
    gender: json['gender'], 
    activityLevel: json['activityLevel'], 
    systolicBP: json['systolicBP'], 
    diastolicBP: json['diastolicBP'], 
    cholesterolLevel: json['cholesterolLevel'], 
    bloodSugar: json['bloodSugar'], 
    hypertension: json['hypertension'], 
    diabetes: json['diabetes'], 
    heartCondition: json['heartCondition'], 
    lowPressure: json['LowPressure'], 
    bmr: json['bmr'], 
    kneePain: json['kneePain'], 
    backPain: json['backPain'], 
    vegetarian: json['vegetarian'],
  );
}
