import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../colors/colors.dart';
import 'chart_data.dart';

class CustomChartColumn extends StatelessWidget {
  final String title;
  final String subTitle;
  final void Function()? onPressed;
  final String? labelFormat;
  final String value;
  final double maxYlabel;
  final double minYlabel;
  final List<ChartData> data;
  final double increaseData;
  final double? interval;
  final double delayAnimation;
  final double animationDuration;

  const CustomChartColumn({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    required this.data,
    this.labelFormat,
    required this.maxYlabel,
    required this.minYlabel,
    required this.increaseData,
    required this.value,
    this.interval,
    this.delayAnimation = 0,
    this.animationDuration = 1500,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: gray9,
        ),
        boxShadow: [
          BoxShadow(
            color: gray4.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
        color: white,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: purple5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width * 0.7,
                child: Text(
                  subTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: gray6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 230,
            padding: const EdgeInsets.only(
              top: 37,
              bottom: 30,
              right: 30,
            ),
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              margin: EdgeInsets.zero,
              enableAxisAnimation: true,
              enableSideBySideSeriesPlacement: false,
              primaryXAxis: const CategoryAxis(
                axisLine: AxisLine(width: 1),
                plotOffset: 12,
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                minimum: minYlabel,
                maximum: maxYlabel,
                interval: interval,
                minorGridLines: const MinorGridLines(width: 0),
                labelFormat: labelFormat,
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
              ),
              series: <CartesianSeries<ChartData, String>>[
                ColumnSeries<ChartData, String>(
                  dataSource: data,
                  animationDuration: animationDuration,
                  animationDelay: animationDuration,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y + increaseData,
                  color: gray13.withOpacity(0.57),
                  trackBorderWidth: 0,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(90),
                    topRight: Radius.circular(90),
                  ),
                  width: 0.4,
                ),
                ColumnSeries<ChartData, String>(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  color: purple2,
                  trackBorderWidth: 0,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(90),
                    topRight: Radius.circular(90),
                  ),
                  width: 0.4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
