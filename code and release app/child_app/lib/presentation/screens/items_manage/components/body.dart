import 'package:child_app/business_logic/blocs/child_bloc.dart';
import 'package:child_app/data/models/child_response.dart';
import 'package:child_app/presentation/screens/childs/components/list_of_children.dart';
import 'package:flutter/material.dart';
import 'package:child_app/business_logic/blocs/item_bloc.dart';
import 'package:child_app/business_logic/blocs/wait_done_bloc.dart';
import 'package:child_app/data/models/behavior.dart';
import 'package:child_app/data/models/goal.dart';

import 'package:child_app/data/models/item.dart';
import 'package:child_app/data/models/item_model.dart';
import 'package:child_app/data/models/item_response.dart';
import 'package:child_app/data/models/skill.dart';
import 'package:child_app/presentation/screens/items_manage/components/item_card.dart';

import 'package:child_app/presentation/widgets/error_widget.dart';
import 'package:child_app/presentation/widgets/loading_widget.dart';

class Body extends StatelessWidget {
  Body() {
   itemBloC.getItems();
  }
  @override
  Widget build(BuildContext context) {
     return StreamBuilder<ItemResponse>(
       stream: itemBloC.subject.stream,
       builder: (context, AsyncSnapshot<ItemResponse> snapshot) {
         if (snapshot.hasData) {
           if (snapshot.data.error != null && snapshot.data.error.length > 0) {
             //Error in server
            return buildErrorWidget(context, error: 'Error in data fetching');
           } else {
             waitDoneBloC.toggleToDone();
             return buildBody(context, snapshot.data);
           }
         } else if (snapshot.hasError) {
           // Error in connection
          return buildErrorWidget(context, error: 'Error in data fetching');
         } else {
           return buildLoadingWidget();
         }
       },
     );

  }

  List<ItemModel> generateItems(List<Behavior> l1, List<Goal> l2, List<Skill> l3) {
    List<ItemModel> i = new List();
    i.addAll(l1
        .map((e) => ItemModel(
            id: e.id,
            name: e.name,
            points: 3.0,
            type: e.type,
            typeName: e.typeName,
            description: e.description))
        .toList());
    i.addAll(l2
        .map((e) => ItemModel(
            id: e.id,
            name: e.name,
            points: 3.0,
            type: e.type,
            typeName: e.typeName,
            description: e.description))
        .toList());
    i.addAll(l3
        .map((e) => ItemModel(
            id: e.id,
            name: e.name,
            points:e.point,
            type: e.type,
            typeName: e.typeName,
            description: e.description))
        .toList());
    return i;
  }

  Widget buildBody(BuildContext context, ItemResponse items) {
    List l1 = items.items.behaviors;
    List l2 = items.items.goals;
    List l3 = items.items.skills;

    List<ItemModel> i = generateItems(l1, l2, l3);
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 25),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: i.length,
          itemBuilder: (context, index) {
            return ItemCard(
              id: i[index].id,
              name: i[index].name,
              point: i[index].points,
              type: i[index].type,
              typeName: i[index].typeName,
              description: i[index].description,
              
            );
          }),
    );
  }
}
