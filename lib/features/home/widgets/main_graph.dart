import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class MainTransactions extends StatefulWidget {
  const MainTransactions({super.key});

  @override
  State<MainTransactions> createState() => _MainTransactionsState();
}

class _MainTransactionsState extends State<MainTransactions> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: LineChart(
          mainData(),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey);
    Widget text;
    switch (value.toInt()) {
      case 3:
        text = const Text('2D', style: style);
        break;
      case 6:
        text = const Text('4D', style: style);
        break;
      case 9:
        text = const Text('5D', style: style);
        break;
      case 12:
        text = const Text('6D', style: style);
        break;
      case 15:
        text = const Text('7D', style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.withOpacity(0.2),
            strokeWidth: 0.5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: GlobalVariables.secondaryColor,
          tooltipRoundedRadius: 8,
          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
            final val = lineBarsSpot[0].y * 100;
            return [
              LineTooltipItem(
                '\$${val.toInt()}',
                const TextStyle(color: Colors.black),
              ),
            ];
          },
        ),
        handleBuiltInTouches: true,
      ),
      minX: 0,
      maxX: 17,
      minY: 0,
      maxY: 9,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 1),
            FlSpot(1, 1.7),
            FlSpot(2, 3.4),
            FlSpot(3, 3.8),
            FlSpot(4, 6),
            FlSpot(5, 5.6),
            FlSpot(6, 3.8),
            FlSpot(7, 5.5),
            FlSpot(7, 5),
            FlSpot(8, 6.2),
            FlSpot(9, 5),
            FlSpot(10, 6),
            FlSpot(11, 7),
            FlSpot(12, 6.2),
            FlSpot(13, 6),
            FlSpot(14, 5.8),
            FlSpot(15, 5),
            FlSpot(16, 4),
            FlSpot(17, 3.8),
          ],
          isCurved: true,
          barWidth: 3,
          color: Colors.black,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            checkToShowDot: (spot, barData) {
              return spot.x == 12;
            },
            getDotPainter: (p0, p1, p2, p3) {
              return FlDotCirclePainter(
                radius: 3.0,
                color: GlobalVariables.primaryColorDark,
                strokeColor: GlobalVariables.secondaryColor,
                strokeWidth: 4.0,
              );
            },
          ),
        ),
      ],
    );
  }
}
