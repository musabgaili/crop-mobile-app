import 'package:cropsense/providers/weekly_summary.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/colors.dart';

class WeeklySummaryChart extends ConsumerWidget {
  const WeeklySummaryChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<double>> weeklySummaries =
        ref.watch(weeklySummariesProvider);
    final int selectedIndex = ref.watch(selectedWeekIndexProvider);

    // Dropdown button
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<int>(
          value: selectedIndex,
          items: List.generate(
            weeklySummaries.length,
            (index) => DropdownMenuItem<int>(
              value: index,
              child: Text('Week ${index + 1}'),
            ),
          ),
          onChanged: (int? newIndex) {
            if (newIndex != null) {
              ref.read(selectedWeekIndexProvider.notifier).state = newIndex;
            }
          },
        ),
        const SizedBox(height: 20),
        // Chart
        SizedBox(
          height: 300,
          child: Consumer(
            builder: (context, ref, child) {
              final List<double> selectedWeek = ref.watch(selectedWeekProvider);
              final List<double> nextWeek = ref.watch(weeklySummariesProvider)[
                  (selectedIndex + 1) %
                      weeklySummaries.length]; // Example for next week

              return ColoredBarChartDouble(
                firstWeeklySummary: selectedWeek,
                secondWeeklySummary: nextWeek,
                firstBarColor: mainColor,
                secondBarColor: contrastColor,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ColoredBarChartDouble extends StatelessWidget {
  final List<double> firstWeeklySummary;
  final List<double> secondWeeklySummary;
  final Color firstBarColor;
  final Color secondBarColor;

  const ColoredBarChartDouble({
    super.key,
    required this.firstWeeklySummary,
    required this.secondWeeklySummary,
    required this.firstBarColor,
    required this.secondBarColor,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the maximum value from both data sets
    double maxValue = ([...firstWeeklySummary, ...secondWeeklySummary])
        .reduce((a, b) => a > b ? a : b);

    // Ensure there's some padding above the maximum value
    double maxY = (maxValue * 1.1).ceilToDouble(); // Adding 10% padding

    MyBarData myBarData = MyBarData(
      firstDataSet: firstWeeklySummary,
      secondDataSet: secondWeeklySummary,
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(30.0, 5, 10, 5),
      height: 300,
      child: BarChart(BarChartData(
        maxY: maxY,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true, getTitlesWidget: getBottomTitles))),
        backgroundColor: greyColor,
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                        toY: data.barRods[0].toY,
                        color: firstBarColor,
                        width: 10.0,
                        borderRadius: BorderRadius.circular(40.0)),
                    BarChartRodData(
                        toY: data.barRods[1].toY,
                        color: secondBarColor,
                        width: 10.0,
                        borderRadius: BorderRadius.circular(40.0)),
                  ],
                ))
            .toList(),
      )),
    );
  }
}

class MyBarData {
  final List<double> firstDataSet;
  final List<double> secondDataSet;

  MyBarData({required this.firstDataSet, required this.secondDataSet});

  List<BarChartGroupData> get barData {
    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: firstDataSet[index],
            // color: Colors.blue, // Adjust color if needed
            width: 10.0,
            borderRadius: BorderRadius.circular(40.0),
          ),
          BarChartRodData(
            toY: secondDataSet[index],
            // color: Colors.red, // Adjust color if needed
            width: 10.0,
            borderRadius: BorderRadius.circular(40.0),
          ),
        ],
      );
    });
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  List<String> weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(
      weekdays[value.toInt()],
      style: const TextStyle(fontSize: 10),
    ),
  );
}
