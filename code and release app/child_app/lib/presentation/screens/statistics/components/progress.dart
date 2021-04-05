import 'package:flutter/material.dart';

class ProgressIndecator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyCustomPainter() ,
      child: Container(
      ),   
    );
  }
}

class MyCustomPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  } 
    @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
   return true;
  }
  


}