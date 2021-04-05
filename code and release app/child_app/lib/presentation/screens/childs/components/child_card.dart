import 'package:flutter/material.dart';
import 'package:child_app/data/models/child.dart';
import 'package:child_app/presentation/screens/child_detile/child_detile_screen.dart';
import 'package:child_app/util/size_config.dart';

class ChildCard extends StatelessWidget {
  final Child child;
 
  const ChildCard({
    Key key, this.child,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChildDetile(child)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: SizeConfig.screenHeight * 0.12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.blueAccent, blurRadius: 5)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 28,
              ),
              onPressed: () {},
            ),
            Spacer(),
            Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  child.name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            SizedBox(
              width: 10,
            ),
            Hero(
              tag: child.id,
              child: Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("asset/img/babyIcon.png"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
