import 'package:flutter/material.dart';

class AlreadyAnAccountCheak extends StatelessWidget {
  final bool isLogin;
  final Function onPress;
  const AlreadyAnAccountCheak({
    Key key, this.isLogin, this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text("لا تملك حساب ؟"), GestureDetector(
        onTap: onPress,
        child: Text(isLogin?"تسجيل":"دخول",style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),))],
    );
  }
}
