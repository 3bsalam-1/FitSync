import '../../../services/pref.dart';
import '../../../services/smart_watch_services.dart';

final smartWatch = SmartWatchServices();

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final dynamic y;
}

class SmartWatchWeekData {
  final List<ChartData> weekDataSleep;
  final List<ChartData> weekDataSteps;
  final List<ChartData> weekDataWater;
  final List<ChartData> weekDataCalories;
  final double totalSleep;
  final double totalSteps;
  final double totalWater;
  final double totalCalories;

  SmartWatchWeekData({
    required this.weekDataSleep,
    required this.weekDataSteps,
    required this.weekDataWater,
    required this.weekDataCalories,
    required this.totalSleep,
    required this.totalSteps,
    required this.totalWater,
    required this.totalCalories,
  });
}

Future<SmartWatchWeekData> showSmartWatchDataWeekly() async {
  List<String> weeks = ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'];
  List<ChartData> defualtData = [
    ChartData('Mon', 0,),
    ChartData('Tues', 0),
    ChartData('Wed', 0),
    ChartData('Thurs', 0),
    ChartData('Fri', 0),
    ChartData('Sat', 0),
    ChartData('Sun', 0),
  ];
  List<ChartData> weekDataSleep = defualtData;
  List<ChartData> weekDataSteps = defualtData;
  List<ChartData> weekDataWater = defualtData;
  List<ChartData> weekDataCalories = defualtData;
  double totalSleep = 0;
  double totalSteps = 0;
  double totalWater = 0;
  double totalCalories = 0;
  int dayNow = DateTime.now().weekday;
  int j = 0;
  
  if (Prefs.getBool("watch-permission") != null) {
    if (Prefs.getBool("watch-permission")!) {
      for (int i = 0; i < 7; i++) {
        var sleep = await smartWatch.getSleepData(i + 1, dayNow - i) ?? 0;
        weekDataSleep.add(ChartData(
          weeks[j],
          sleep,
        ));
        var steps = await smartWatch.getStepsData(i + 1, dayNow - i) ?? 0;
        weekDataSteps.add(ChartData(
          weeks[j],
          steps,
        ));
        var water = await smartWatch.getWaterData(i + 1, dayNow - i);
        weekDataWater.add(ChartData(
          weeks[j],
          water?["waterL"] ?? 0,
        ));
        var calories = await smartWatch.getCaloriesData(i + 1, dayNow - i);
        weekDataCalories.add(ChartData(
          weeks[j],
          calories ?? 0,
        ));
        totalSleep += sleep.toDouble();
        totalSteps += steps.toDouble();
        totalWater += water?["waterL"]?.toDouble() ?? 0;
        totalCalories += calories?.toDouble() ?? 0;
        ++j;
      }
    }
  }

  return SmartWatchWeekData(
    weekDataSleep: weekDataSleep,
    weekDataSteps: weekDataSteps,
    weekDataWater: weekDataWater,
    weekDataCalories: weekDataCalories,
    totalSleep: totalSleep,
    totalSteps: totalSteps,
    totalWater: totalWater,
    totalCalories: totalCalories,
  );
}
