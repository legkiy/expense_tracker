import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarChart(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        toY: y,
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.tertiary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary,
          ],
          transform: const GradientRotation(pi / 40),
        ),
        width: 16,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 5,
          color: Colors.grey.shade300,
        ),
      ),
    ]);
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (index) {
        switch (index) {
          case 0:
            return makeGroupData(index, 2);
          case 1:
            return makeGroupData(index, 3);
          case 2:
            return makeGroupData(index, 2);
          case 3:
            return makeGroupData(index, 4.5);
          case 4:
            return makeGroupData(index, 3.8);
          case 5:
            return makeGroupData(index, 1.5);
          case 6:
            return makeGroupData(index, 4);
          case 7:
            return makeGroupData(index, 3.8);

          default:
            return throw Error();
        }
      });

  BarChartData mainBarChart() {
    return BarChartData(
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
              reservedSize: 35,
              getTitlesWidget: getTiles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 25,
              getTitlesWidget: getLeftTiles,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        barGroups: showingGroups());
  }

  Widget getTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('0${value.toInt() + 1}', style: style);
        break;
      case 1:
        text = Text('0${value.toInt() + 1}', style: style);
        break;
      case 2:
        text = Text('0${value.toInt() + 1}', style: style);
        break;
      case 4:
        text = Text('0${value.toInt() + 1}', style: style);
        break;
      case 5:
        text = Text('0${value.toInt() + 1}', style: style);
        break;
      case 6:
        text = Text('0${value.toInt() + 1}', style: style);
        break;
      case 7:
        text = Text('0${value.toInt() + 1}', style: style);
        break;
      default:
        text = Text('0${value.toInt() + 1}', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  Widget getLeftTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    );
    String text;
    switch (value) {
      case 0:
        text = '1K';
        break;
      case 2:
        text = '2K';
        break;
      case 3:
        text = '3K';
        break;
      case 4:
        text = '4K';
        break;
      case 5:
        text = '5K';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
