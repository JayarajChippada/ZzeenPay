import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class MonthlyTransactions extends StatelessWidget {
  const MonthlyTransactions({
    super.key,
    Color? mainLineColor,
    Color? belowLineColor,
    Color? aboveLineColor,
  })  : mainLineColor = mainLineColor ?? GlobalVariables.primaryColor,
        belowLineColor = belowLineColor ?? const Color(0xFF50E4FF),
        aboveLineColor = aboveLineColor ?? const Color(0xFF2196F3);

  final Color mainLineColor;
  final Color belowLineColor;
  final Color aboveLineColor;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 1,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: mainLineColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const cutOffYValue = 5.0;

    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
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
          lineBarsData: [
            LineChartBarData(
                spots: const [
                  FlSpot(-1, 4),
                  FlSpot(0, 4),
                  FlSpot(1, 3.5),
                  FlSpot(2, 4.5),
                  FlSpot(3, 1),
                  FlSpot(4, 4),
                  FlSpot(5, 6),
                  FlSpot(6, 6.5),
                  FlSpot(7, 6),
                  FlSpot(8, 4),
                  FlSpot(9, 6),
                  FlSpot(10, 6),
                  FlSpot(11, 7),
                  FlSpot(12, 7.5),
                ],
                isCurved: true,
                barWidth: 3,
                color: mainLineColor,
                belowBarData: BarAreaData(
                  show: true,
                  color: belowLineColor,
                  cutOffY: cutOffYValue,
                  applyCutOffY: true,
                ),
                aboveBarData: BarAreaData(
                  show: true,
                  color: aboveLineColor,
                  cutOffY: cutOffYValue,
                  applyCutOffY: true,
                ),
                dotData: FlDotData(
                  show: true,
                  checkToShowDot: (spot, barData) {
                    return spot.x == 10;
                  },
                  getDotPainter: (p0, p1, p2, p3) {
                    return FlDotCirclePainter(
                      radius: 3.0,
                      color: GlobalVariables.primaryColorDark,
                      strokeColor: GlobalVariables.secondaryColor,
                      strokeWidth: 4.0,
                    );
                  },
                )),
          ],
          minY: 0,
          titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: Text(
                '2019',
                style: TextStyle(
                  fontSize: 14,
                  color: mainLineColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 18,
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
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1,
            checkToShowHorizontalLine: (double value) {
              return value == 1 || value == 6 || value == 4 || value == 5;
            },
          ),
        ),
      ),
    );
  }
}
