import 'package:child_app/business_logic/blocs/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:child_app/presentation/screens/home/components/detile_container_card.dart';

class DetileContainer extends StatefulWidget {
  
  const DetileContainer({
    Key key,
  }) : super(key: key);

  @override
  _DetileContainerState createState() => _DetileContainerState();
}

class _DetileContainerState extends State<DetileContainer> {
  
  @override
  void initState() { 
    super.initState();
    Future.wait([ userBloC.getUser(),]).then((value) {
  
    });

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black26

            )
            ],
            borderRadius: BorderRadius.circular(30)
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 65,
              child: Row(
            children: <Widget>[
              Expanded(
                child: DetileContainerCard(
                  title: '43',
                  subTitle: 'النقاط',
                  icon: Icons.control_point,
                  alignment: 'L',
                  fontColor:Colors.black
                ),
              ),

              Expanded(
                           child: DetileContainerCard(
                  title: '123',
                  subTitle: 'سلوكيات',
                  icon: Icons.person,
                  alignment: 'R',
                  fontColor:Colors.white
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

