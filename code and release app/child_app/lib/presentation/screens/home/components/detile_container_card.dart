import 'package:flutter/material.dart';

class DetileContainerCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final String alignment;
  final Color fontColor;
  const DetileContainerCard({
    Key key, this.title, this.subTitle, this.icon, this.alignment, this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        alignment: Alignment.center,
       
        decoration: BoxDecoration(
    
            color:(alignment == 'R')? Colors.blueAccent:Colors.white,
            borderRadius:(alignment == 'L')?BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(50)):
            BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30),topLeft: Radius.circular(40))
            ),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  color:fontColor,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(subTitle,style: TextStyle(fontSize: 17,color: fontColor.withOpacity(0.8),fontWeight: FontWeight.bold),),
                SizedBox(
                  width: 7,
                ),
                Icon(
                  icon,
                  size: 19,
                  color: fontColor,
                )
              ],
            )
          ],
        ));
  }
}
