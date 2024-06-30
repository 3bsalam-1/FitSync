class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final dynamic y;
}

List<ChartData> dataSleep = [
  ChartData('Sun', 7),
  ChartData('Mon', 8),
  ChartData('Tues', 9),
  ChartData('Wed', 7),
  ChartData('Thurs', 9),
  ChartData('Fri', 6),
  ChartData('Sat', 9.5),
];

List<ChartData> dataSteps = [
  ChartData('Sun', 6000),
  ChartData('Mon', 7000),
  ChartData('Tues', 8000),
  ChartData('Wed', 6000),
  ChartData('Thurs', 8000),
  ChartData('Fri', 4800),
  ChartData('Sat', 8500),
];

List<ChartData> dataWater = [
  ChartData('Sun', 1),
  ChartData('Mon', 2),
  ChartData('Tues', 2.5),
  ChartData('Wed', 3),
  ChartData('Thurs', 3.3),
  ChartData('Fri', 3.8),
  ChartData('Sat', 4),
];

List<ChartData> dataCalories = [
  ChartData('Sun', 890),
  ChartData('Mon', 800),
  ChartData('Tues', 1200),
  ChartData('Wed', 800),
  ChartData('Thurs', 1200),
  ChartData('Fri', 800),
  ChartData('Sat', 1200),
];
