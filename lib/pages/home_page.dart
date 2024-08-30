import 'package:fitness_tracker/utils/responsive.dart';
import 'package:fitness_tracker/widgets/dashboard.dart';
import 'package:fitness_tracker/widgets/side_menu.dart';
import 'package:fitness_tracker/widgets/summery.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final isDekstop = Responsive.isDekstop(context);
    return Scaffold(
      drawer: !isDekstop ? SizedBox(
        width: MediaQuery.of(context).size.width*0.8 , child: const SideMenu(),
        ):null,
      endDrawer: !isDekstop ? SizedBox(
        width: MediaQuery.of(context).size.width*0.8 , child: const Summery(),
        ):null,
      body: SafeArea(child: 
        Row(
          children: [
            if(isDekstop)
            const Expanded(
              flex: 2,
              child: SizedBox(
                width: 250,
                child: SideMenu(),
              )
            ),
            const Expanded(
              flex: 7,
              child: SizedBox(
              width: 250,
              child: Dashboard(),
              )
            ),
            if(isDekstop)
            const Expanded(
              flex: 3,
              child: SizedBox(
              width: 250,
              child: Summery()
              )
            ),
          ],
        )
      ),
    );
  }
}