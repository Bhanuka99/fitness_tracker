import 'package:fitness_tracker/constants/colors.dart';
import 'package:fitness_tracker/data/scheduled_data.dart';
import 'package:fitness_tracker/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {

    final scheduledData = ScheduledData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Scheduled",style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: secondaryColor
          ),
          ),
          const SizedBox(height: 12,),
          //show scheduled data
          for (var index = 0 ; index < scheduledData.scheduledTasks.length ; index++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CustomCard(
                color: limeColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(scheduledData.scheduledTasks[index].title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: secondaryColor
                    ),
                    ),
                    Text(scheduledData.scheduledTasks[index].date,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: greyColor
                    ),
                    ),
                      ],
                    ),
                  const Icon(Icons.alarm,color: secondaryColor,)
                  ],
                ),
                ),
            ),
      ],
    );
  }
}