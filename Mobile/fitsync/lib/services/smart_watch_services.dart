import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import '../data/models/smart_watch_model.dart';

class SmartWatchServices {
  final List<HealthDataType> types = [
    HealthDataType.HEART_RATE,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.WATER,
    HealthDataType.DISTANCE_DELTA,
  ];

  void initSmartWatch() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();
    await Health().configure(useHealthConnectIfAvailable: true);
  }

  Future<SmartWatchModel?> getSmartWatchData() async {
    bool requested = await Health().requestAuthorization(types);
    if (requested) {
      Map<String, dynamic> heartRate = await getHeartRateData();
      Map<String, dynamic> bloodOxygen = await getBloodGlucoseData();
      Map<String, dynamic> bloodGlucose = await getBloodOxygenData();
      Map<String, dynamic> calories = await getCaloriesData();
      Map<String, dynamic> sleep = await getSleepData();
      Map<String, dynamic> water = await getWaterData();
      Map<String, dynamic> steps = await getStepsData();
      Map<String, dynamic> walking = await getWalkingData();

      return SmartWatchModel(
        heartRate: heartRate['value'],
        heartRateDay: heartRate['day'],
        bloodOxygen: bloodOxygen['value'],
        bloodOxygenDay: bloodOxygen['day'],
        bloodGlucose: bloodGlucose['value'],
        bloodGlucoseDay: bloodGlucose['day'],
        calories: calories['value'],
        caloriesDay: calories['day'],
        sleep: sleep['value'],
        sleepDay: sleep['day'],
        water: water['value'],
        waterDay: water['day'],
        steps: steps['value'],
        stepsDay: steps['day'],
        walking: walking['value'],
        walkingDay: walking['day'],
      );
    }
    return null;
  }

  Future<Map<String, dynamic>> getHeartRateData() async {
    try {
      List<double> heartRate = [];
      List<int> heartRateDays = [];

      final healthData = await Health().getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [HealthDataType.HEART_RATE],
      );
      heartRate = healthData
          .map(
            (item) => item.value.toJson()['numeric_value'] as double,
          )
          .toList();
      heartRateDays = healthData.map((item) => item.dateTo.weekday).toList();
      return {
        'value': heartRate,
        'day': heartRateDays,
      };
    } catch (error) {
      debugPrint('There is an error $error');
      return {};
    }
  }

  Future<Map<String, dynamic>> getBloodGlucoseData() async {
    try {
      List<double> bloodGlucose = [];
      List<int> bloodGlucoseDays = [];

      final healthData = await Health().getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [HealthDataType.BLOOD_GLUCOSE],
      );
      bloodGlucose = healthData
          .map(
            (item) => item.value.toJson()['numeric_value'] as double,
          )
          .toList();
      bloodGlucoseDays = healthData.map((item) => item.dateTo.weekday).toList();
      return {
        'value': bloodGlucose,
        'day': bloodGlucoseDays,
      };
    } catch (error) {
      debugPrint('There is an error $error');
      return {};
    }
  }

  Future<Map<String, dynamic>> getBloodOxygenData() async {
    try {
      List<double> bloodOxygen = [];
      List<int> bloodOxygenDays = [];

      final healthData = await Health().getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [HealthDataType.BLOOD_OXYGEN],
      );
      bloodOxygen = healthData
          .map(
            (item) => item.value.toJson()['numeric_value'] as double,
          )
          .toList();
      bloodOxygenDays = healthData.map((item) => item.dateTo.weekday).toList();
      return {
        'value': bloodOxygen,
        'day': bloodOxygenDays,
      };
    } catch (error) {
      debugPrint('There is an error $error');
      return {};
    }
  }

  Future<Map<String, dynamic>> getStepsData() async {
    try {
      List<int> steps = [];
      List<int> stepsDays = [];

      final healthData = await Health().getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [HealthDataType.STEPS],
      );
      steps = healthData
          .map((item) => item.value.toJson()['numeric_value'] as int)
          .toList();
      stepsDays = healthData.map((item) => item.dateTo.weekday).toList();

      return {
        'value': steps.map((e) => e.toDouble()).toList(),
        'day': stepsDays,
      };
    } catch (error) {
      debugPrint('There is an error yyy $error');
      return {};
    }
  }

  Future<Map<String, dynamic>> getCaloriesData() async {
    try {
      List<double> calories = [];
      List<int> caloriesdays = [];

      final healthData = await Health().getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [HealthDataType.ACTIVE_ENERGY_BURNED],
      );
      calories = healthData
          .map(
            (item) => item.value.toJson()['numeric_value'] as double,
          )
          .toList();

      caloriesdays = healthData.map((item) => item.dateTo.weekday).toList();
      return {
        'value': calories,
        'day': caloriesdays,
      };
    } catch (error) {
      debugPrint('There is an error $error');
      return {};
    }
  }

  Future<Map<String, dynamic>> getSleepData() async {
    try {
      List<double> sleep = [];
      List<int> sleepDays = [];
      double minute = 0;
      final healthData = await Health().getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [HealthDataType.SLEEP_ASLEEP],
      );
      sleep = healthData.map((item) {
        minute = item.value.toJson()['numeric_value'] as double;
        return (minute / 60);
      }).toList();
      sleepDays = healthData.map((item) => item.dateTo.weekday).toList();
      return {
        'value': sleep,
        'day': sleepDays,
      };
    } catch (error) {
      debugPrint('There is an error $error');
      return {};
    }
  }

  Future<Map<String, dynamic>> getWaterData() async {
    try {
      List<double> water = [];
      List<int> waterDays = [];

      final healthData = await Health().getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [HealthDataType.WATER],
      );
      water = healthData
          .map(
            (item) => item.value.toJson()['numeric_value'] as double,
          )
          .toList();
      waterDays = healthData.map((item) => item.dateTo.weekday).toList();
      return {
        'value': water,
        'day': waterDays,
      };
    } catch (error) {
      debugPrint('There is an error $error');
      return {};
    }
  }

  Future<Map<String, dynamic>> getWalkingData() async {
    try {
      List<double> walking = [];
      List<int> walkingDays = [];

      final healthData = await Health().getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [HealthDataType.DISTANCE_DELTA],
      );
      walking = healthData
          .map(
            (item) => item.value.toJson()['numeric_value'] as double,
          )
          .toList();
      walkingDays = healthData.map((item) => item.dateTo.weekday).toList();
      return {
        'value': walking,
        'day': walkingDays,
      };
    } catch (error) {
      debugPrint('There is an error $error');
      return {};
    }
  }
}
