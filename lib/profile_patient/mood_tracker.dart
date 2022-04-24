import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MoodTracker extends StatefulWidget {
  const MoodTracker({Key? key}) : super(key: key);

  @override
  State<MoodTracker> createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(
        text: 'Mood Tracker',
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<GDPData, String>(
          dataSource: _chartData,
          xValueMapper: (GDPData data, _) => data.continent,
          yValueMapper: (GDPData data, _) => data.gdp,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          enableTooltip: true,
        ),
      ],
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Sad', 60),
      GDPData('Frustrated', 40),
      GDPData('Irritated', 35),
      GDPData('Fine', 30),
      GDPData('Good', 20),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
