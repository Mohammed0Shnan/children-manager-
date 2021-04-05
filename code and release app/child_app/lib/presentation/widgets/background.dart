import 'package:flutter/material.dart';
import 'package:child_app/util/size_config.dart';


class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -15 * SizeConfig.heightMulti,
            left: -15 * SizeConfig.heightMulti,
            child: Container(
              width: 32 * SizeConfig.heightMulti,
              height: 32 * SizeConfig.heightMulti,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[       
                  Colors.purple[50], Colors.purple[500]] ,
                
           ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -30 * SizeConfig.heightMulti,
            top: -30 * SizeConfig.heightMulti,
            child: Container(
              width: 62 * SizeConfig.heightMulti,
              height: 62 * SizeConfig.heightMulti,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors:[
                    Colors.purple[50], Colors.purple[500]
                  ],
                  ),
                color: Colors.purple[300],
              ),
            ),
          ),
          Positioned(
            left: -15 * SizeConfig.heightMulti,
            bottom: -15 * SizeConfig.heightMulti,
            child: Container(
              width: 23 * SizeConfig.heightMulti,
              height: 23 * SizeConfig.heightMulti,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.shade200,
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
