import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:schulupparent/student/theme/theme_helper.dart';

class AcademicProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Color(0xffF7F7F8)),
      height: 180,
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
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Padding(
                        padding: const EdgeInsets.only(left: 68, bottom: 0),
                        child: Text(
                          "Academic Progress",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    case 3:
                      return Padding(
                        padding: const EdgeInsets.only(right: 98, top: 5),
                        child: Text(
                          "Details >",
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFF8D2A),
                          ),
                        ),
                      );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Padding(
                        padding: const EdgeInsets.only(left: 48, top: 5),
                        child: Text(
                          "Nursery 1 A",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      );
                    case 3:
                      return Padding(
                        padding: const EdgeInsets.only(right: 98, top: 5),
                        child: Text(
                          "Primary 5A",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
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
