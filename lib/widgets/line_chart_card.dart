import 'package:fitness_tracker/constants/colors.dart';
import 'package:fitness_tracker/data/line_chart_data.dart';
import 'package:fitness_tracker/widgets/custom_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {

    //Import line chart data
    final lineChartData = LineChartDetails();

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Steps Overview",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: greyColor
          ),
          ),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 16/6,
            child: LineChart(
              LineChartData(
                lineTouchData: const LineTouchData(
                  handleBuiltInTouches: true,
                ),
                titlesData: FlTitlesData(
                  //remove the right title
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false
                    )
                  ),
                  //remove the top title
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false
                    )
                  ),
                  //bottom title
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value,TitleMeta meta) {
                        return lineChartData.bottomTitle[value.toInt()] != null ? SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            lineChartData.bottomTitle[value.toInt()].toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: greyColor
                            ),
                          ), 
                          ) : const SizedBox();
                      },
                    )
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 30,
                      getTitlesWidget: (double value,TitleMeta meta) {
                        return lineChartData.leftTitle[value.toInt()] != null ?
                        Text(
                            lineChartData.leftTitle[value.toInt()].toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: greyColor,
                            ),
                          ): const SizedBox();
                      },
                    )
                  )
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    color: selectionColor,
                    barWidth: 2.5,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          selectionColor.withOpacity(0.5),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        ),
                    ),
                    dotData: const FlDotData(
                      show: false,
                    ),
                    spots: lineChartData.spots,
                  )
                ],
                minX: 0,
                maxX: 120,
                minY: 0,
                maxY: 100,
              )
            ),
            ),

        ],
      ));
  }
}