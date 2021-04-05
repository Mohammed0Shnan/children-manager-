import 'package:flutter/material.dart';
import 'package:child_app/business_logic/blocs/child_detile_bloc.dart';
import 'package:child_app/data/models/child.dart';
import 'package:child_app/presentation/screens/child_detile/components/body.dart';

class ChildDetile extends StatelessWidget {
  final Child child;
  

  ChildDetile(this.child){
    childDetilBloC.getBehaviorById(child.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          appBar: AppBar(
        title: Text("معلومات الطفل",
        style: TextStyle(fontSize: 22,
        fontWeight: FontWeight.bold,
        
        ),
        ),
        backgroundColor: Colors.purple[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.of(context).pop();
          },

        ),
      
      ),
      body: Body(child: child,),
    );
  }
}