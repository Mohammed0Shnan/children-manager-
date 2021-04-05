import 'package:flutter/material.dart';
import 'package:child_app/data/models/child.dart';
import 'package:child_app/presentation/screens/childs/components/child_card.dart';

Container buildListOfChildren(context , List<Child> childs) {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10, top: 25),
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: childs.length,
      itemBuilder: (context , index){
        return ChildCard(
          child: childs[index],
     
        );
      }
      ),
  );
}
