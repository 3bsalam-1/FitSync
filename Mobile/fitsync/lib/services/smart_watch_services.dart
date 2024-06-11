import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_health_connect/flutter_health_connect.dart';
import '../data/models/smart_watch_model.dart';

class SmartWatchServices {
  final List<HealthConnectDataType> types = [
    HealthConnectDataType.HeartRate,
    HealthConnectDataType.BloodGlucose,
    HealthConnectDataType.BloodPressure,
    HealthConnectDataType.Distance,
    HealthConnectDataType.Steps,
    HealthConnectDataType.TotalCaloriesBurned,
    HealthConnectDataType.SleepSession,
    HealthConnectDataType.Hydration,
    HealthConnectDataType.OxygenSaturation,
  ];
  bool permission = false;

  Future<bool> initSmartWatch() async {
    permission = await HealthConnectFactory.hasPermissions(types);
    if (!permission) {
      await HealthConnectFactory.requestPermissions(types);
      permission = await HealthConnectFactory.hasPermissions(types); 
    } 
    return permission;
  }

  Future<SmartWatchModel?> getSmartWatchData(
      [int startDay = 1, int endDay = 0]) async {
    var bloodGlucose = await getBloodGlucoseData(startDay, endDay);
    var heartRate = await getHeartRateData(startDay, endDay);
    Map<String, num>? bloodPressure =
        await getBloodPressureData(startDay, endDay);
    Map<String, num>? distance = await getDistanceData(startDay, endDay);
    var steps = await getStepsData(startDay, endDay);
    var calories = await getCaloriesData(startDay, endDay);
    var sleep = await getSleepData(startDay, endDay);
    Map<String, num>? water = await getWaterData(startDay, endDay);
    var bloodOxygen = await getBloodOxygenData(startDay, endDay);

    return SmartWatchModel(
      heartRate: heartRate ?? 0,
      bloodOxygen: bloodOxygen ?? 0,
      bloodGlucose: bloodGlucose ?? 0,
      systolic: bloodPressure?["systolic"] ?? 0,
      diastolic: bloodPressure?["diastolic"] ?? 0,
      calories: calories ?? 0,
      sleep: sleep ?? 0,
      waterML: water?["waterML"] ?? 0,
      waterL: water?["waterL"] ?? 0,
      steps: steps ?? 0,
      distanceM: distance?["meters"] ?? 0,
      distanceKM: distance?["kilometers"] ?? 0,
    );
  }

  Future<num?> getHeartRateData([int startDay = 1, int endDay = 0]) async {
    try {
      num? heartRate;

      final healthData = await HealthConnectFactory.getRecord(
        startTime: DateTime.now().subtract(Duration(days: startDay)),
        endTime: DateTime.now().subtract(Duration(days: endDay)),
        type: types[0],
      );
      List<dynamic> allData = healthData["records"];
      if (allData.isNotEmpty) {
        Map<dynamic, dynamic> data = allData.last["samples"][0];
        heartRate = data.values.first;
      }
      debugPrint("the heart rate is $heartRate");
      return heartRate ?? 0;
    } catch (error) {
      debugPrint('There is an error $error');
      return null;
    }
  }

  Future<num?> getBloodGlucoseData([int startDay = 1, int endDay = 0]) async {
    try {
      num? bloodGlucose;

      final healthData = await HealthConnectFactory.getRecord(
        startTime: DateTime.now().subtract(Duration(days: startDay)),
        endTime: DateTime.now().subtract(Duration(days: endDay)),
        type: types[1],
      );
      List<dynamic> allData = healthData["records"];
      if (allData.isNotEmpty) {
        Map<dynamic, dynamic> data = allData.last["level"];
        bloodGlucose = data.values.first;
      }
      debugPrint("the blood glucose is $bloodGlucose");
      return bloodGlucose ?? 0;
    } catch (error) {
      debugPrint('There is an error $error');
      return null;
    }
  }

  Future<Map<String, num>?> getBloodPressureData(
      [int startDay = 1, int endDay = 0]) async {
    try {
      num? diastolic;
      num? systolic;
      final healthData = await HealthConnectFactory.getRecord(
        startTime: DateTime.now().subtract(Duration(days: startDay)),
        endTime: DateTime.now().subtract(Duration(days: endDay)),
        type: types[2],
      );

      List<dynamic> allData = healthData["records"];
      if (allData.isNotEmpty) {
        Map<dynamic, dynamic> data = allData.last["diastolic"];
        Map<dynamic, dynamic> data2 = allData.last["systolic"];
        diastolic = data.values.first;
        systolic = data2.values.first;
      }
      debugPrint(
          "the blood Pressure is diastolic : $diastolic , systolic : $systolic");
      return {
        "diastolic": diastolic ?? 0,
        "systolic": systolic ?? 0,
      };
    } catch (error) {
      debugPrint('There is an error $error');
      return null;
    }
  }

  Future<Map<String, num>?> getDistanceData(
      [int startDay = 1, int endDay = 0]) async {
    try {
      num? distanceM;
      num? distanceKM;

      final healthData = await HealthConnectFactory.getRecord(
        startTime: DateTime.now().subtract(Duration(days: startDay)),
        endTime: DateTime.now().subtract(Duration(days: endDay)),
        type: types[3],
      );
      List<dynamic> allData = healthData["records"];
      if (allData.isNotEmpty) {
        Map<dynamic, dynamic> data = allData.last["distance"];
        distanceM = data["meters"];
        distanceKM = data["kilometers"];
      }
      debugPrint("the walking distance is $distanceM m, $distanceKM km");
      return {
        "distanceM": distanceM ?? 0,
        "distanceKM": distanceKM ?? 0,
      };
    } catch (error) {
      debugPrint('There is an error $error');
      return null;
    }
  }

  Future<num?> getStepsData([int startDay = 1, int endDay = 0]) async {
    try {
      num? steps;

      final healthData = await HealthConnectFactory.getRecord(
        startTime: DateTime.now().subtract(Duration(days: startDay)),
        endTime: DateTime.now().subtract(Duration(days: endDay)),
        type: types[4],
      );
      List<dynamic> allData = healthData["records"];
      if (allData.isNotEmpty) {
        steps = allData.last["count"];
      }
      debugPrint("the steps is $steps");
      return steps ?? 0;
    } catch (error) {
      debugPrint('There is an error: $error');
      return null;
    }
  }

  Future<num?> getCaloriesData([int startDay = 1, int endDay = 0]) async {
    try {
      num? calories;

      final healthData = await HealthConnectFactory.getRecord(
        startTime: DateTime.now().subtract(Duration(days: startDay)),
        endTime: DateTime.now().subtract(Duration(days: endDay)),
        type: types[5],
      );
      List<dynamic> allData = healthData["records"];
      if (allData.isNotEmpty) {
        calories = allData.last["kilocalories"];
      }
      debugPrint("the calories is $calories");
      return calories ?? 0;
    } catch (error) {
      debugPrint('There is an error $error');
      return null;
    }
  }

  Future<num?> getSleepData([int startDay = 1, int endDay = 0]) async {
    try {
      num? sleep;
      final healthData = await HealthConnectFactory.getRecord(
        startTime: DateTime.now().subtract(Duration(days: startDay)),
        endTime: DateTime.now().subtract(Duration(days: endDay)),
        type: types[6],
      );
      List<dynamic> allData = healthData["records"];
      if (allData.isNotEmpty) {
        sleep = allData.last["metadata"]["recordingMethod"];
      }
      debugPrint("the sleep is $sleep");
      return sleep ?? 0;
    } catch (error) {
      debugPrint('There is an error $error');
      return null;
    }
  }

  Future<Map<String, num>?> getWaterData(
      [int startDay = 1, int endDay = 0]) async {
    try {
      num? waterL;
      num? waterML;

      final healthData = await HealthConnectFactory.getRecord(
        startTime: DateTime.now().subtract(Duration(days: startDay)),
        endTime: DateTime.now().subtract(Duration(days: endDay)),
        type: types[7],
      );
      List<dynamic> allData = healthData["records"];
      if (allData.isNotEmpty) {
        waterL = allData.last["volume"]["liters"];
        waterML = allData.last["volume"]["milliliters"];
      }
      debugPrint("the water is: $waterML ml, $waterL l");
      return {
        "waterL": waterL ?? 0,
        "waterML": waterML ?? 0,
      };
    } catch (error) {
      debugPrint('There is an error $error');
      return null;
    }
  }

  Future<num?> getBloodOxygenData([int startDay = 1, int endDay = 0]) async {
    try {
      num? bloodOxygen;

      final healthData = await HealthConnectFactory.getRecord(
        startTime: DateTime.now().subtract(Duration(days: startDay)),
        endTime: DateTime.now().subtract(Duration(days: endDay)),
        type: types[8],
      );
      List<dynamic> allData = healthData["records"];
      if (allData.isNotEmpty) {
        bloodOxygen = allData.last["percentage"]["value"];
      }
      debugPrint("the blood oxygen is: $bloodOxygen");
      return bloodOxygen;
    } catch (error) {
      debugPrint('There is an error $error');
      return null;
    }
  }
}
