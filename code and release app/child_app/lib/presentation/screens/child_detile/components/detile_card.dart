
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:child_app/presentation/screens/child_detile/components/more_detil_container.dart';
import 'package:child_app/util/size_config.dart';

class DetileCard extends StatelessWidget {
  final String name;
  final String description;
  final String type;
  final String typeName;
  final double points;
  const DetileCard({
    Key key,
    this.name,
    this.description,
    this.type,
    this.typeName,
    this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle style1 = TextStyle(
        fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white);
    const TextStyle style2 = TextStyle(
      fontSize: 18,
      color: Colors.white,
    );

    return OpenContainer(
      closedBuilder: (context, VoidCallback openContainer) {
           return GestureDetector(
             onTap: openContainer
             ,
           child: Container(
             alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.only(right: 20, top: 10, left: 10, bottom: 5),
      width: SizeConfig.screenWidth * 0.7,
      height: SizeConfig.screenHeight * 0.3,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(30),

      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              RichText(
                text: TextSpan(
                    text: 'الاسم',
                    style: style1,
                    children: [TextSpan(text: ' : ' + name, style: style2)]),
              ),
              RichText(
                text: TextSpan(
                    text: 'اسم النوع',
                    style: style1,
                    children: [TextSpan(text: ' : ' + typeName, style: style2)]),
              ),
              RichText(
                text: TextSpan(
                    text: 'النوع',
                    style: style1,
                    children: [TextSpan(text: ' : ' + type, style: style2)]),
              ),
              RichText(
                text: TextSpan(text: 'النقط', style: style1, children: [
                  TextSpan(text: ' : ' + points.toString(), style: style2)
                ]),
              ),

          ],
        ),
      ),
    ),
           );
      },
      openBuilder:
          (BuildContext context,_) {
            return MoreDetileContainer(
              description: description,
            );
          },
    );


  }
}
