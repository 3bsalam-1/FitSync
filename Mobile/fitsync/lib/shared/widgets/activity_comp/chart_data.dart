class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final dynamic y;
}

List<ChartData> dataSteps = [
  ChartData('Sun', 6000),
  ChartData('Mon', 7000),
  ChartData('Tues', 8000),
  ChartData('Wed', 6000),
  ChartData('Thurs', 8000),
  ChartData('Fri', 4800),
  ChartData('Sat', 8500),
];

List<ChartData> showSmartWatchDataWeekly(
  List<double>? dataValues,
  List<int>? dataDays,
) {
  List<double> heartRateAve = [];
  List<int> days = [];
  List<String> weeks = ['Sun', 'Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat'];
  List<ChartData> weekData = [];
  late int index;

  if (dataDays != null && dataValues != null) {
    if (dataDays.isNotEmpty) {
      days = dataDays.toSet().toList();
      for (int day in days) {
        index = dataDays.indexOf(day);
        if (index != -1) {
          heartRateAve.add(dataValues[index]);
        }
      }
    }
  }

  int indexDay = 0;
  bool isFound = false;
  for (int i = 0; i < weeks.length; i++) {
    isFound = days.contains(i + 1);
    if (isFound) {
      weekData.add(ChartData(
        weeks[i],
        heartRateAve[indexDay],
      ));
      ++indexDay;
    } else {
      weekData.add(ChartData(
        weeks[i],
        0,
      ));
    }
  }
  return weekData;
}

double getTotalData(List<ChartData> data) {
  double sum = 0;
  for (var element in data) {
    sum += element.y as num;
  }
  return sum.roundToDouble();
}
