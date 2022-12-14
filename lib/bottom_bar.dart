import 'package:cgpa_all_uni/util/variables.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

import 'Calculation Screen/calculation.dart';
import 'Home Screen/home.dart';

class BottomBar extends StatefulWidget {
  int bottomIndex = 0, cardIndex = -1;
  BottomBar({Key? key, required this.bottomIndex, required this.cardIndex}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  //int _selectedIndex = 0;
/*
* if(widget.bottomIndex == 1 && widget.cardIndex == -1)...[
    //CalculationScreen(index: -1),
    ]else if(widget.bottomIndex == 1 && widget.cardIndex != -1)...[
    //CalculationScreen(index: widget.cardIndex),
    ]else ...[
    //HomeScreen(),
    _options[widget.bottomIndex],
    ]*/

  Widget check(){
    globalCardIndex = widget.cardIndex;
    if(widget.bottomIndex == 1 && widget.cardIndex == -1){
      return const CalculationScreen(index: -1);
    }else if(widget.bottomIndex == 1 && widget.cardIndex != -1){
      return CalculationScreen(index: widget.cardIndex);
    }else{
      widget.bottomIndex = 0;
      widget.cardIndex = -1;
      return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: check(),
      ),
          //child: _options[widget.bottomIndex],
        bottomNavigationBar: CurvedNavigationBar(
          index: widget.bottomIndex,
          color: Colors.blue.shade400,
          backgroundColor: Colors.white,
          //animationDuration: Duration(milliseconds: 350),
          height: 45,
          items: const [
            Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            Icon(Icons.calculate,
              color: Colors.white,)
          ],
          onTap: (index){
              setState(() {
                widget.bottomIndex = index;
              });
          },
        ),
      );
  }
}
