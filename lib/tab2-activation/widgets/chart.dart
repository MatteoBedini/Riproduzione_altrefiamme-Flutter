import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key, required this.points});

  final List<int> points;

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  List<int> get points => widget.points;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: _chartGroups(),
        borderData: FlBorderData(
            border: const Border(bottom: BorderSide(color: Colors.grey), left: BorderSide(color: Colors.grey))),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: _bottomTitles),
          leftTitles: AxisTitles(sideTitles: _leftTitles),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return points.asMap().entries.map((entry) {
      int index = entry.key;
      int point = entry.value;
      return BarChartGroupData(
        x: index,  // Usa l'indice per x
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: point.toDouble(),  // Usa il valore del punto per toY
            color: Colors.red,
          )
        ],
      );
    }).toList();
  }

  SideTitles get _leftTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = '0';
          break;
        case 5:
          text = '5';
          break;
        case 10:
          text = '10';
          break;
        case 15:
          text = '15';
          break;
        case 20:
          text = '20';
          break;
      }
      return Text(text, style: const TextStyle(color: Colors.grey, fontSize: 10));

    },
  );
  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
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
      }

      return Text(text, style: const TextStyle(color: Colors.grey, fontSize: 8));
    },
  );
}
