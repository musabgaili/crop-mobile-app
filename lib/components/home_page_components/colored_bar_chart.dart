import '../../utils/colors.dart';
import '../bar_chart_components/bar_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ColoredBarChart extends StatelessWidget {
  final List<double> weeklySummary;
  final Color barColor;
  final String name;
  const ColoredBarChart(
      {super.key,
      required this.weeklySummary,
      required this.barColor,
      required this.name});

  @override
  Widget build(BuildContext context) {
    // print(weeklySummary);
    MyBarData myBarData = MyBarData(
        sunAmount: weeklySummary[0],
        monAmount: weeklySummary[1],
        tueAmount: weeklySummary[2],
        wedAmount: weeklySummary[3],
        thuAmount: weeklySummary[4],
        friAmount: weeklySummary[5],
        satAmount: weeklySummary[6]);
    double maxY = weeklySummary.reduce((a, b) => a > b ? a : b);
    myBarData.initializeBarData();
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(color: barColor, height: 15.0, width: 15.0),
                const SizedBox(width: 8.0),
                Text(name, textAlign: TextAlign.center),
              ],
            )),
        Container(
          padding: const EdgeInsets.fromLTRB(30.0, 5, 10, 5),
          height: 300,
          child: BarChart(BarChartData(
            maxY: maxY + maxY * 0.1,
            minY: 0,
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true, getTitlesWidget: getBottomTitles)),
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: getLeftTitles)),
            ),
            backgroundColor: greyColor,
            barGroups: myBarData.barData
                .map((data) => BarChartGroupData(x: data.x, barRods: [
                      BarChartRodData(
                          toY: data.y,
                          color: barColor,
                          width: 10.0,
                          borderRadius: BorderRadius.circular(40.0))
                    ]))
                .toList(),
          )),
        ),
      ],
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  List<String> weekdays = ['sun', 'Mon', 'Tue', 'wed', 'thu', 'fri', 'sat'];

  return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        weekdays[value.toInt()],
        style: const TextStyle(fontSize: 10),
      ));
}

Widget getLeftTitles(double value, TitleMeta meta) {
  return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        value.toInt().toString(),
        style: const TextStyle(fontSize: 8),
        maxLines: 1,
      ));
}
