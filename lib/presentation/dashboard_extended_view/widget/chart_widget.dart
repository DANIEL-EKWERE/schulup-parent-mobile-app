import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AcademicProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 3,
          minY: 0,
          maxY: 100,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 20,
            getDrawingHorizontalLine:
                (value) =>
                    FlLine(strokeWidth: 0.4, color: Colors.grey.shade300),
          ),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text(
                        "Nursery 1 A",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      );
                    case 3:
                      return Text(
                        "Primary 5A",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 20,
                getTitlesWidget:
                    (value, _) => Text(
                      value.toInt().toString(),
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: Colors.orange,
              barWidth: 3,
              dotData: FlDotData(
                show: true,
                getDotPainter:
                    (p, a, c, d) => FlDotCirclePainter(
                      radius: 4,
                      color: Colors.white,
                      strokeColor: Colors.orange,
                      strokeWidth: 3,
                    ),
              ),
              belowBarData: BarAreaData(show: false),
              spots: const [
                FlSpot(0, 70),
                FlSpot(1, 35),
                FlSpot(2, 60),
                FlSpot(3, 95),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
