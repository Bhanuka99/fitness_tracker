import 'package:fitness_tracker/constants/colors.dart';
import 'package:fitness_tracker/pages/home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fitness Tracker",
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const HomePage(),
    ) ;
  }
}