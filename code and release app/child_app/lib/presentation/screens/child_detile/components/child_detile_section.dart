import 'package:flutter/material.dart';

class ChildDetileSection extends StatelessWidget {
  final DateTime date;
  final String gender;
  final double points;
  const ChildDetileSection({
    Key key,
    this.date,
    this.gender,
    this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  style: textStyle,
                  text: 'النقط',
                  children: [TextSpan(text: '  : $points ')]),
            ),
            RichText(
              text: TextSpan(
                  style: textStyle,
                  text: ' الجنس',
                  children: [TextSpan(text: '  : $gender  ')]),
            ),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RichText(
              text:
                  TextSpan(style: textStyle, text: ' تاريخ الميلاد', children: [
                TextSpan(text: '  : ${date.day}-${date.month}-${date.year} ')
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
