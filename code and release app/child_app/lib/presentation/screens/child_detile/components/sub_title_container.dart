import 'package:flutter/material.dart';

class SubTitleContainer extends StatelessWidget {
  final String title;
  const SubTitleContainer({
    Key key, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.purple[900],
        
        
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
