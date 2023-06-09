import 'package:flutter/material.dart';
import 'package:troso/dronemap/screens/dronemap.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const DroneMapScreen(),
    );
  }
}
