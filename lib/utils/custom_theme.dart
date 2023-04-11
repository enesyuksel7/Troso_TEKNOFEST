import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static const Color grey = Color(0xFF105F5F);
  static const Color yellow = Color(0xFF26BACB);
  static const cardShadow = [
    BoxShadow(color: grey, blurRadius: 6, spreadRadius: 4, offset: Offset(0, 2))
  ];
  static const buttonShadow = [
    BoxShadow(color: grey, blurRadius: 3, spreadRadius: 4, offset: Offset(1, 3))
  ];

  static getCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(35),
      boxShadow: CustomTheme.cardShadow,
    );
  }

  static ThemeData getTheme() {
    Map<String, double> fontsize = {
      "sm": 14,
      "md": 18,
      "lg": 24,
    };

    return ThemeData(
        primaryColor: yellow,

        fontFamily: 'DMSans',
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            toolbarHeight: 70,
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'DMSans',
                fontSize: fontsize['lg'],
                fontWeight: FontWeight.bold,
                letterSpacing: 4)),
        tabBarTheme: const TabBarTheme(labelColor: yellow, unselectedLabelColor: Colors.black),
        textTheme: TextTheme(
            headlineLarge: TextStyle(color: Colors.black,fontSize: fontsize['lg'],fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(color: Colors.black, fontSize: fontsize['md'],fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(color: Colors.black,fontSize: fontsize['sm'],fontWeight: FontWeight.bold),
            bodySmall: TextStyle(
                fontSize: fontsize['sm'], fontWeight: FontWeight.normal),
            titleSmall: TextStyle(fontSize: fontsize['sm'],
                fontWeight: FontWeight.bold,
                letterSpacing: 1)));
  }
}