import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/home/screens/expenses_screen.dart';

class YearlyTransactions extends StatefulWidget {
  final bool isWidget;
  const YearlyTransactions({super.key, required this.isWidget});

  @override
  State<YearlyTransactions> createState() => _YearlyTransactionsState();
}

class _YearlyTransactionsState extends State<YearlyTransactions> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(widget.isWidget)
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, ExpensesScreen.routeName),
                child: const Icon(
                  Icons.auto_graph,
                  color: Colors.white,
                )),
          ),
        AspectRatio(
          aspectRatio: 1.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
        fontWeight: FontWeight.normal, fontSize: 10, color: widget.isWidget  ? Colors.white : GlobalVariables.primaryColor);
    Widget text;
    switch (value.toInt()) {
      case 1:
        text =  Text('1D', style: style);
        break;
      case 3:
        text =  Text('5D', style: style);
        break;
      case 5:
        text =  Text('1M', style: style);
        break;
      case 7:
        text =  Text('3M', style: style);
        break;
      case 9:
        text =  Text('6M', style: style);
        break;
      case 11:
        text =  Text('1Y', style: style);
        break;
      default:
        text =  Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.white,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 2:
        text = '50';
        break;
      case 4:
        text = '100';
        break;
      case 6:
        text = '500';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: widget.isWidget ? Colors.white.withOpacity(0.2) : GlobalVariables.primaryColor.withOpacity(0.2),
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: widget.isWidget
                ? Colors.white.withOpacity(0.2)
                : GlobalVariables.primaryColor.withOpacity(0.2),
            strokeWidth: 0,
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
        leftTitles: widget.isWidget ? AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ) : const AxisTitles(
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
      maxX: 12,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 2),
            FlSpot(1.3, 1),
            FlSpot(2, 1.5),
            FlSpot(3, 1.8),
            FlSpot(4, 3.9),
            FlSpot(5.2, 6.1),
            FlSpot(6, 3.8),
            FlSpot(7, 5.5),
            FlSpot(7.5, 5.8),
            FlSpot(8, 4.4),
            FlSpot(9.5, 6.5),
            FlSpot(10, 5.4),
            FlSpot(11, 4.4),
          ],
          isCurved: true,
          barWidth: 3,
          color: widget.isWidget ? Colors.white : GlobalVariables.primaryColor,
          isStrokeCapRound: true,
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
          ),
        ),
      ],
    );
  }
}
