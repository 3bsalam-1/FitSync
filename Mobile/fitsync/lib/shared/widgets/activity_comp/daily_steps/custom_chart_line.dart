import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../colors/colors.dart';
import '../../global/custom_animated_opacity.dart';
import '../chart_data.dart';

class CustomChartLine extends StatelessWidget {
  final List<ChartData>? data;
  const CustomChartLine({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedOpacity(
      child: Container(
        height: 235,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: purple5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          enableAxisAnimation: true,
          backgroundColor: purple5,
          enableSideBySideSeriesPlacement: false,
          primaryXAxis: CategoryAxis(
            axisLine: const AxisLine(width: 1, color: white),
            labelStyle: GoogleFonts.poppins(
              fontSize: 12,
              color: white,
              fontWeight: FontWeight.w500,
            ),
            majorGridLines: const MajorGridLines(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
          ),
          primaryYAxis: const NumericAxis(
            minimum: 0,
            maximum: 2500,
            labelStyle: TextStyle(
              fontSize: 0,
            ),
            minorGridLines: MinorGridLines(width: 0),
            majorGridLines: MajorGridLines(width: 1, color: white),
            axisLine: AxisLine(width: 0, color: white),
            majorTickLines: MajorTickLines(width: 0),
          ),
          series: <CartesianSeries<ChartData, String>>[
            SplineSeries<ChartData, String>(
              animationDuration: 2700,
              animationDelay: 800,
              splineType: SplineType.cardinal,
              markerSettings: const MarkerSettings(
                isVisible: true,
                color: cyan5,
                width: 10,
                height: 10,
                borderColor: cyan5,
              ),
              dataSource: data,
              xValueMapper: (ChartData dataSource, _) => dataSource.x,
              yValueMapper: (ChartData dataSource, _) => dataSource.y,
              color: white,
              width: 4,
            ),
          ],
        ),
      ),
    );
  }
}
