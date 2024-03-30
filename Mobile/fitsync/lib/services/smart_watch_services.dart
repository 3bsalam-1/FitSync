import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class SmartWatchServices {
  
  void initSmartWatch() async {
    await Health().configure(useHealthConnectIfAvailable: true);
    await Permission.location.request();
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
        for (HealthDataPoint element in healthData) {
          debugPrint('the heart rate is: ${element.value.toJson()['numericValue']}');
          heartRate.add(element.value.toJson()['numericValue']);
        }
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
        for (HealthDataPoint element in healthData) {
          debugPrint('the Blood Glucose is: ${element.value.toJson()['numericValue']}');
          bloodGlucose.add(element.value.toJson()['numericValue']);
        }
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
        for (HealthDataPoint element in healthData) {
          debugPrint('the Blood Oxygen is: ${element.value.toJson()['numericValue']}');
          bloodOxygen.add(element.value.toJson()['numericValue']);
        }
        return bloodOxygen;
      } catch (error) {
        debugPrint('There is an error $error');
        return [];
      }
    }
    return [];
  }
}
