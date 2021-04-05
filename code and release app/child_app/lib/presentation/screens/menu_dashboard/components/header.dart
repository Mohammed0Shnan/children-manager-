
import 'package:flutter/material.dart';
import 'package:child_app/util/size_config.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Colors.purple[900],Colors.purple[300],],
           
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
            color: Colors.purple[800],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        height: SizeConfig.screenHeight * 0.16,
        child: Column(
          children: <Widget>[ 
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "اسم الطفل",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10,),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                      color: Colors.white,
                        style: BorderStyle.solid,
                      ),
                      image: DecorationImage(
                        image: AssetImage('asset/img/babyIcon.png'),
                        fit: BoxFit.cover,
                      )),

                ),
              ],
            ),
            SizedBox(height: 10,)
          ],
        ));
  }
}
