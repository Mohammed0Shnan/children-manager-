import 'package:flutter/material.dart';
import 'package:child_app/data/models/item_model.dart';
import 'package:child_app/util/size_config.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final String name;
  final String description;
  final String type;
  final double point;
  final String typeName;

  const ItemCard({
    Key key,
    this.id,
    this.name,
    this.description,
    this.type,
    this.point,
    this.typeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ChildDetile(child)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: SizeConfig.screenHeight * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.blueAccent, blurRadius: 5)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 28,
              ),
              onPressed: () {},
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      typeName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                                   Text(
                      type,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                                   Text(
                      point.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
