import 'package:flutter/material.dart';
import 'package:child_app/presentation/screens/items_manage/components/body_item.dart';

class AddItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor:Colors.purple[900],
         title: Text(
           'اضافة عنصر',
           style: TextStyle(
             fontSize: 22,
             color: Colors.white,
             fontWeight: FontWeight.bold
           ),
         ),
      ),
      body: BodyItem(),
    );
  }
}