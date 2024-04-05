import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class SmartWatchServices {
  final List<HealthDataType> types = [
    HealthDataType.HEART_RATE,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  void initSmartWatch() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();
    await Health().configure(useHealthConnectIfAvailable: true);
  }

  Future<List<double>> getHeartRateData() async {
    final bool requested =
        await Health().requestAuthorization([HealthDataType.HEART_RATE]);
    if (requested) {
      try {
        final List<double> heartRate;
        final List<HealthDataPoint> healthData =
            await Health().getHealthDataFromTypes(
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
    final bool requested =
        await Health().requestAuthorization([HealthDataType.BLOOD_GLUCOSE]);
    if (requested) {
      try {
        final List<double> bloodGlucose;
        final List<HealthDataPoint> healthData =
            await Health().getHealthDataFromTypes(
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
    final bool requested =
        await Health().requestAuthorization([HealthDataType.BLOOD_OXYGEN]);
    if (requested) {
      try {
        final List<double> bloodOxygen;
        final List<HealthDataPoint> healthData =
            await Health().getHealthDataFromTypes(
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
    PermissionStatus statusPermission =
        await Permission.activityRecognition.request();
    bool requested = false;
    if (statusPermission == PermissionStatus.granted) {
      requested = await Health().requestAuthorization([HealthDataType.STEPS]);
    }
    if (requested) {
      try {
        final List<double> steps;
        final List<HealthDataPoint> healthData =
            await Health().getHealthDataFromTypes(
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
    final bool requested = await Health()
        .requestAuthorization([HealthDataType.ACTIVE_ENERGY_BURNED]);
    if (requested) {
      try {
        final List<double> calories;
        final List<HealthDataPoint> healthData =
            await Health().getHealthDataFromTypes(
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
    final bool requested =
        await Health().requestAuthorization([HealthDataType.SLEEP_ASLEEP]);
    if (requested) {
      try {
        final List<double> sleep;
        final List<HealthDataPoint> healthData =
            await Health().getHealthDataFromTypes(
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
