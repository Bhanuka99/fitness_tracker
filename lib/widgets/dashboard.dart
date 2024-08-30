import 'package:fitness_tracker/widgets/activity_details.dart';
import 'package:fitness_tracker/widgets/bar_graph_card.dart';
import 'package:fitness_tracker/widgets/header_widget.dart';
import 'package:fitness_tracker/widgets/line_chart_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
                height: 15,
              ),
              HeaderWidget(),
              SizedBox(
                height: 15,
              ),
              ActivityDetails(),
              SizedBox(height: 15),
              LineChartCard(),
              SizedBox(height: 15),
              BarGraphCard(),
              SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}