import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SleepTracker extends StatefulWidget {
  const SleepTracker({Key? key}) : super(key: key);

  @override
  State<SleepTracker> createState() => _SleepTrackerState();
}

class _SleepTrackerState extends State<SleepTracker> {
  late List<SleepData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: SfCartesianChart(
        title: ChartTitle(
          text: 'Sleep Tracker',
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        legend: Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          LineSeries<SleepData, double>(
              name: 'Sleep',
              dataSource: _chartData,
              xValueMapper: (SleepData sales, _) => sales.day,
              yValueMapper: (SleepData sales, _) => sales.hours,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
        primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis(
          labelFormat: '{value} hrs',
          // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
        ),
      ),
    );
  }

  List<SleepData> getChartData() {
    final List<SleepData> chartData = [
      SleepData(1, 10),
      SleepData(2, 12),
      SleepData(3, 7),
      SleepData(4, 9),
      SleepData(5, 5),
      SleepData(6, 15),
      SleepData(7, 10),
    ];
    return chartData;
  }
}

class SleepData {
  SleepData(this.day, this.hours);
  final double day;
  final double hours;
}
