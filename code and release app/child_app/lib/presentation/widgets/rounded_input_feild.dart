import 'package:flutter/material.dart';
import 'package:child_app/util/size_config.dart';


class RoundedInputFeild extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isSecure;

  final ValueChanged valueChanged;
  const RoundedInputFeild({
    Key key,
    this.hintText,
    this.icon,
    this.valueChanged, this.isSecure,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.purple.shade50, borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
        obscureText: isSecure,
        onChanged: valueChanged,
        decoration: InputDecoration(
         
            labelText: hintText, icon: Icon(icon), border: InputBorder.none),
      ),
    );
  }
}
