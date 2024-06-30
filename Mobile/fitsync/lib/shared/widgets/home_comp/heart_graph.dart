import 'dart:async';
import 'dart:math' as math;
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/activity_comp/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HeartGraph extends StatefulWidget {
  const HeartGraph({super.key});

  @override
  State<HeartGraph> createState() => _HeartGraphState();
}

class _HeartGraphState extends State<HeartGraph> {
  //late List<LiveData> chartData;
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  List<LiveData> getChartData() {
    List<LiveData> data = [];

    for (int i = 0, j = 0; i <= 100 && j <= 100; i += 1) {
      double y = _heartbeatFunction(i.toDouble() / 10);

      data.add(LiveData(j, y, purple5));

      data.add(LiveData(j, -y, purple5));

      j += 5;
    }
    return data;
  }

  double _heartbeatFunction(double x) {
    return math.cos(x);
  }

  // List<LiveData> getChartData() {
  //   return <LiveData>[
  //     LiveData(0, 0, black),
  //     LiveData(2, 10, black),
  //     LiveData(4, 0, black),
  //     LiveData(6, -10, black),
  //     LiveData(8, 0, black),
  //     LiveData(10, 10, black),
  //     LiveData(12, 0, black),
  //     LiveData(14, -10, black),
  //     LiveData(0, 0, black),
  //     LiveData(0, 0, black),
  //   ];
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chartData = getChartData();
    Timer.periodic(Duration(seconds: 1), updateDataSource);
  }

  int time = 100;
  updateDataSource(Timer timer) {
    chartData
        .add(LiveData(time += 3, math.Random().nextInt(200) + -100, purple5));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 150,
        child: SfCartesianChart(
            plotAreaBorderColor: white,
            primaryXAxis: CategoryAxis(
              isVisible: false,
            ),
            primaryYAxis: NumericAxis(
              isVisible: false,
            ),
            series: <LineSeries<LiveData, int>>[
              LineSeries<LiveData, int>(
                  onRendererCreated: (ChartSeriesController controller) {
                    _chartSeriesController = controller;
                  },
                  
                  // Bind data source
                  dataSource: chartData,
                  pointColorMapper: (LiveData data, _) => data.color,
                  xValueMapper: (LiveData data, _) => data.time,
                  yValueMapper: (LiveData data, _) => data.speed)
            ]));
  }
}

class LiveData {
  final int time;
  final num speed;
  final Color color;

  LiveData(this.time, this.speed, this.color);
}
