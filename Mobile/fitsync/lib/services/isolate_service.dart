import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'smart_watch_services.dart';

class IsolateService {
  final watchService = SmartWatchServices();

  Future<List<double>> _getSleepDataService(dynamic token) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
    final data = await watchService.getSleepData();
    return data;
  }

  Future<List<double>?> getSleepDataService() async {
    final token = RootIsolateToken.instance;
    final data = await compute(_getSleepDataService, token);
    return data;
  }

  Future<List<double>> _getHeartRateDataService(dynamic token) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
    final data = await watchService.getHeartRateData();
    return data;
  }

  Future<List<double>?> getHeartRateDataService() async {
    final token = RootIsolateToken.instance;
    final data = await compute(_getHeartRateDataService, token);
    return data;
  }

  Future<List<double>> _getBloodGlucoseDataService(dynamic token) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
    final data = await watchService.getBloodGlucoseData();
    return data;
  }

  Future<List<double>?> getBloodGlucoseDataService() async {
    final token = RootIsolateToken.instance;
    final data = await compute(_getBloodGlucoseDataService, token);
    return data;
  }

  Future<List<double>> _getBloodOxygenDataService(dynamic token) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
    final data = await watchService.getBloodOxygenData();
    return data;
  }

  Future<List<double>?> getBloodOxygenDataService() async {
    final token = RootIsolateToken.instance;
    final data = await compute(_getBloodOxygenDataService, token);
    return data;
  }

  Future<List<double>> _getCaloriesDataService(dynamic token) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
    final data = await watchService.getCaloriesData();
    return data;
  }

  Future<List<double>?> getCaloriesDataService() async {
    final token = RootIsolateToken.instance;
    final data = await compute(_getCaloriesDataService, token);
    return data;
  }
}
