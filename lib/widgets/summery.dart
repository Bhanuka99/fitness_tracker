import 'package:fitness_tracker/constants/colors.dart';
import 'package:fitness_tracker/utils/responsive.dart';
import 'package:fitness_tracker/widgets/pie_chart_card.dart';
import 'package:fitness_tracker/widgets/schedule_card.dart';
import 'package:fitness_tracker/widgets/summary_details.dart';
import 'package:flutter/material.dart';

class Summery extends StatefulWidget {
  const Summery({super.key});

  @override
  State<Summery> createState() => _SummeryState();
}

class _SummeryState extends State<Summery> {
  @override
  Widget build(BuildContext context) {
    final bool isDekstop = Responsive.isDekstop(context);
    return Container(
      decoration: BoxDecoration(
        color:!isDekstop ? cardBackgroundColor :null,
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            PieChartCard(),
            SizedBox(height: 16,),
            Text("Summary",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: greyColor
            ),
            ),
            SizedBox(height: 16,),
            SummaryDetails(),
            SizedBox(height: 16,),
            ScheduleCard(),
          ],
        ),
      ),
    );
  }
}