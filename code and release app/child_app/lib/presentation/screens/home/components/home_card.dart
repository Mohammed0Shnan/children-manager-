import 'package:flutter/material.dart';
import 'package:child_app/util/size_config.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onPress;
  final Color color;
  final double degree;
  const HomeCard({
    Key key,
    this.title,
    this.subTitle,
    this.onPress, this.color, this.degree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            width: SizeConfig.screenWidth * 0.9,
           margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  offset: Offset(0,10),
                  color: color,
                  blurRadius: 1
                )]
             ),
            height: 70,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(degree.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            )
          ),
          Positioned(
            right: 60,
            top: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10)
                  ]),
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      alignment: Alignment.centerRight,
                      child: RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                            text: "$title \n",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,fontSize: 20),
                            children: [
                              TextSpan(text: subTitle, style: TextStyle(
                                    color: Colors.black45,
                                fontWeight: FontWeight.bold,fontSize: 18
                              ))
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

