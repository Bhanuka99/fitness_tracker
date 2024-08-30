import 'package:flutter/material.dart';

class Responsive {

  //Method to check whether the divice is mobile
  static bool isMobile (BuildContext context) => 
    MediaQuery.of(context).size.width <850 ;

  //Method to check whether the divice is tablet
  static bool isTablet (BuildContext context) => 
    MediaQuery.of(context).size.width <1100 && MediaQuery.of(context).size.width >= 850;

  //Method to check whether the divice is Dekstop
  static bool isDekstop (BuildContext context) => 
    MediaQuery.of(context).size.width >= 1100 ;

}