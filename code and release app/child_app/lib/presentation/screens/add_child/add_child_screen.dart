import 'package:flutter/material.dart';
import 'package:child_app/presentation/screens/add_child/components/body.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor:Colors.purple[900],
         title: Text(
           'اضافة طفل',
           style: TextStyle(
             fontSize: 22,
             color: Colors.white,
             fontWeight: FontWeight.bold
           ),
         ),
      ),
      body: Body(),
    );
  }
}