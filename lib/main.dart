import 'package:cgpa_all_uni/bottom_bar.dart';
import 'package:flutter/material.dart';

import 'onBoardingPage.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  OnBoardingPage(),//BottomBar(bottomIndex: 0, cardIndex: -1,),
      title: "CPGA Calulator For All University",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

