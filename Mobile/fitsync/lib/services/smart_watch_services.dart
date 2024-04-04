import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class SmartWatchServices {
  void initSmartWatch() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();
    await Health().configure(useHealthConnectIfAvailable: true);
  }

  Future<List<double>> getHeartRateData() async {
    bool requested = await Health().requestAuthorization([HealthDataType.HEART_RATE]);
    if (requested) {
      try {
        List<double> heartRate = [];
        List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.HEART_RATE],
        );
        heartRate = healthData.map((item) {
          return item.value.toJson()['numeric_value'] as double;
        }).toList();
        debugPrint('the heart rate is: $heartRate');
        return heartRate;
      } catch (error) {
        debugPrint('There is an error $error');
        return [];
      }
    }
    return [];
  }

  Future<List<double>> getBloodGlucoseData() async {
    bool requested = await Health().requestAuthorization([HealthDataType.BLOOD_GLUCOSE]);
    if (requested) {
      try {
        List<double> bloodGlucose = [];
        List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.BLOOD_GLUCOSE],
        );
        bloodGlucose = healthData.map((item) {
          return item.value.toJson()['numeric_value'] as double;
        }).toList();
        debugPrint('the Blood Glucose is: $bloodGlucose');
        return bloodGlucose;
      } catch (error) {
        debugPrint('There is an error $error');
        return [];
      }
    }
    return [];
  }

  Future<List<double>> getBloodOxygenData() async {
    bool requested = await Health().requestAuthorization([HealthDataType.BLOOD_OXYGEN]);
    if (requested) {
      try {
        List<double> bloodOxygen = [];
        List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.BLOOD_OXYGEN],
        );
        bloodOxygen = healthData.map((item) {
          return item.value.toJson()['numeric_value'] as double;
        }).toList();
        debugPrint('the Blood Oxygen is: $bloodOxygen');
        return bloodOxygen;
      } catch (error) {
        debugPrint('There is an error $error');
        return [];
      }
    }
    return [];
  }

  Future<List<double>> getStepsData() async {
    PermissionStatus statusPermission = await Permission.activityRecognition.request();
    bool requested = false;
    if (statusPermission == PermissionStatus.granted) {
      requested = await Health().requestAuthorization([HealthDataType.STEPS]);
    }
    if (requested) {
      try {
        List<double> steps = [];
        List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.STEPS],
        );
        steps = healthData.map((item) {
          return item.value.toJson()['numeric_value'] as double;
        }).toList();
        debugPrint('the steps is: $steps');
        return steps;
      } catch (error) {
        debugPrint('There is an error $error');
        return [];
      }
    }
    return [];
  }

  Future<List<double>> getCaloriesData() async {
    bool requested = await Health().requestAuthorization([HealthDataType.ACTIVE_ENERGY_BURNED]);
    if (requested) {
      try {
        List<double> calories = [];
        List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.ACTIVE_ENERGY_BURNED],
        );
        calories = healthData.map((item) {
          return item.value.toJson()['numeric_value'] as double;
        }).toList();
        debugPrint('the Calories Burned is: $calories');
        return calories;
      } catch (error) {
        debugPrint('There is an error $error');
        return [];
      }
    }
    return [];
  }

  Future<List<double>> getSleepData() async {
    bool requested = await Health().requestAuthorization([HealthDataType.SLEEP_ASLEEP]);
    if (requested) {
      try {
        List<double> sleep = [];
        List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          [HealthDataType.SLEEP_ASLEEP],
        );
        sleep = healthData.map((item) {
          return item.value.toJson()['numeric_value'] as double;
        }).toList();
        debugPrint('the Sleep is: $sleep');
        return sleep;
      } catch (error) {
        debugPrint('There is an error $error');
        return [];
      }
    }
    return [];
  }
}
