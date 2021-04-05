import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String icon;
  const SocialIcon({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(icon), fit: BoxFit.cover)),
    );
  }
}
