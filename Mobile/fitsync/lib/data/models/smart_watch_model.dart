class SmartWatchModel {
  final List<double> heartRate;
  final List<double> bloodOxygen;
  final List<double> bloodGlucose;
  final List<double> calories;
  final List<double> sleep;

  SmartWatchModel({
    required this.heartRate, 
    required this.bloodOxygen, 
    required this.bloodGlucose, 
    required this.calories, required this.sleep,
  });
}
