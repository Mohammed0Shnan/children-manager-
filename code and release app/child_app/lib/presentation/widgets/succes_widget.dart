
import 'package:flutter/material.dart';

Widget buildSuccesWidget({message}) {
  return Center(
    child:Container(
      height: 60,
      
       child:Text(message.toString(),style: TextStyle(
         fontSize: 20,
         color: Colors.green
       ),)
    )
  );
}
