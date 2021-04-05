import 'package:flutter/material.dart';
import 'package:child_app/util/size_config.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPress;
  const RoundedButton({
    Key key,
    this.text,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.7,
      height: SizeConfig.heightMulti * 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.titleSize * 4),
          ),
          onPressed: onPress,
          color: Colors.purple[900],
        ),
      ),
    );
  }
}
