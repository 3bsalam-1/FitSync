import 'package:health/health.dart';

class SmartWatchModel {
  final num value;
  final HealthDataType type;
  final DateTime date;

  SmartWatchModel({
    required this.value, 
    required this.type, 
    required this.date,
  });
}
