

import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  Color boxColor;
  bool viewIsSelected;


  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewIsSelected,
    required this.boxColor
  });

  static List<DietModel > getDiets(){
    List<DietModel> diets = [];

       diets.add(
      DietModel(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '30min',
        calories: '180kCal',
        viewIsSelected: true,
        boxColor: const Color(0xff9DCEFF))
    );

    diets.add(
      DietModel(
         name: 'Canai Bread',
       iconPath: 'assets/icons/canai-bread.svg',
       level: 'Easy',
       duration: '20mins',
       calories: '230kCal',
       viewIsSelected: false,
       boxColor: const Color(0xffEEA4CE))
    );

    diets.add(
      DietModel(
         name: 'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '30min',
        calories: '180kCal',
        viewIsSelected: false,
        boxColor: const Color(0xff9DCEFF))
    );

  diets.add(
      DietModel(
         name: 'Canai Bread',
       iconPath: 'assets/icons/canai-bread.svg',
       level: 'Easy',
       duration: '20mins',
       calories: '230kCal',
       viewIsSelected: false,
       boxColor: const Color(0xffEEA4CE))
    );
     return diets;
  }
}