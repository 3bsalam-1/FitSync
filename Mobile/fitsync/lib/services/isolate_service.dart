import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../data/models/smart_watch_model.dart';
import 'smart_watch_services.dart';

class IsolateService {
  final watchService = SmartWatchServices();

  Future<SmartWatchModel?> _getSmartWatchDataService(dynamic token) async {
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
    final data = await watchService.getSmartWatchData();
    return data;
  }

  Future<SmartWatchModel?> getSmartWatchDataService() async {
    final token = RootIsolateToken.instance;
    final data = await compute(_getSmartWatchDataService, token);
    return data;
  }
}
