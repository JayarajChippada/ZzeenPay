import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class WeeklyTransactions extends StatefulWidget {
  const WeeklyTransactions({super.key});

  final Color barBackgroundColor = Colors.white;
  final Color barColor = GlobalVariables.primaryColor;

  @override
  State<StatefulWidget> createState() => WeeklyTransactionsState();
}

class WeeklyTransactionsState extends State<WeeklyTransactions> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Expanded(
              child: BarChart(
                randomData(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color:
              x < 5 && x % 2 != 0 ? widget.barColor : const Color(0xFFDFDFDF),
          borderRadius: BorderRadius.circular(5),
          width: 22,
        ),
      ],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    List<String> days = ['Mon', 'Tues', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    Widget text = Text(
      days[value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      maxY: 300.0,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: GlobalVariables.secondaryColor,
          tooltipRoundedRadius: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '\$${rod.toY}',
              const TextStyle(color: Colors.black),
            );
          },
        ),
        handleBuiltInTouches: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(
        7,
        (i) => makeGroupData(
          i,
          Random().nextInt(290).toDouble() + 10,
        ),
      ),
      gridData: const FlGridData(show: false),
    );
  }
}
