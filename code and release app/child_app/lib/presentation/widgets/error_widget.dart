import 'package:flutter/material.dart';

 buildErrorWidget(context ,{error}) {
  return showDialog(context: context, builder: (context){
     return AlertDialog(
       elevation: 10,

       content:
    Container(
      height: 60,
       child:Text(error,
       style: TextStyle(
         fontSize: 20,
         color: Colors.red   
       )
    )
  ) ,
     );
   });
}
