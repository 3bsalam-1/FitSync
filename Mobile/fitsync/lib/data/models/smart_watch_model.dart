class SmartWatchModel {
  final List<double> heartRate;
  final List<int> heartRateDay;
  final List<double> bloodOxygen;
  final List<int> bloodOxygenDay;
  final List<double> bloodGlucose;
  final List<int> bloodGlucoseDay;
  final List<double> calories;
  final List<int> caloriesDay;
  final List<double> sleep;
  final List<int> sleepDay;
  final List<double> steps;
  final List<int> stepsDay;
  final List<double> water;
  final List<int> waterDay;
  final List<double> walking;
  final List<int> walkingDay;

  SmartWatchModel({
    required this.heartRate,
    required this.heartRateDay,
    required this.bloodOxygen,
    required this.bloodOxygenDay,
    required this.bloodGlucose,
    required this.bloodGlucoseDay,
    required this.calories,
    required this.caloriesDay,
    required this.sleep,
    required this.sleepDay,
    required this.steps,
    required this.stepsDay,
    required this.water,
    required this.waterDay,
    required this.walking,
    required this.walkingDay,
  });
}
