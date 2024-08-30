import 'package:fitness_tracker/constants/colors.dart';
import 'package:fitness_tracker/data/bar_graph_data.dart';
import 'package:fitness_tracker/models/graph_model.dart';
import 'package:fitness_tracker/utils/responsive.dart';
import 'package:fitness_tracker/widgets/custom_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraphCard extends StatelessWidget {
  const BarGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    //import bar graph data
    final barData = BarGraphData();
    final bool isMobile = Responsive.isMobile(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: barData.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: !isMobile ? 3 : 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 15,
        childAspectRatio: 5/4,
        ), 
      itemBuilder: (context, index) {
        return CustomCard(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(barData.data[index].lable,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: greyColor
                ),
                ),
              ),
              const SizedBox(height: 12),
              //bar graph
              Expanded(
                child: BarChart(
                  BarChartData(
                    barGroups: _chartGroups(
                      color: barData.data[index].color,
                      points: barData.data[index].graph,
                    ),
                    borderData: FlBorderData(
                      show: false
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(
                        sideTitles: const SideTitles(
                          showTitles: false
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value,TitleMeta meta) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(barData.lable[value.toInt()],
                              style: const TextStyle(
                                fontSize: 11,
                                color: greyColor,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                            );
                          },
                        )
                      )
                    ),
                  ),
                ),
              ),
            ],
          )
          );
      },
      );
  }
  List <BarChartGroupData> _chartGroups(
    {
      required List <GraphModel> points,
      required Color color
    }
  ){
    return points.map((point) => BarChartGroupData(
      x: point.x.toInt(),
      barRods: [
        BarChartRodData(toY: point.y,
        width: 12,
        color: color.withOpacity(point.y.toInt() >4 ? 1 : 0.4),
        borderRadius: const BorderRadius.only(
          topLeft:Radius.circular(10),
          topRight: Radius.circular(10), 
          )
        ),
      ]
    ),
    ).toList(); 
  }
}