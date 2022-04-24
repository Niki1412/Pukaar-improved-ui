import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SleepGraph extends StatefulWidget {
  const SleepGraph({Key? key}) : super(key: key);

  @override
  State<SleepGraph> createState() => _SleepGraphState();
}

class _SleepGraphState extends State<SleepGraph> {
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
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        RadialBarSeries<GDPData, String>(
          dataSource: _chartData,
          xValueMapper: (GDPData data, _) => data.continent,
          yValueMapper: (GDPData data, _) => data.gdp,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          enableTooltip: true,
          maximumValue: 100,
          trackColor: Colors.white,
          radius: '80%',
        ),
      ],
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Sleep', 72),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
