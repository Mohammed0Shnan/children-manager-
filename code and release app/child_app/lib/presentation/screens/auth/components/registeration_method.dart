import 'package:flutter/material.dart';
import 'package:child_app/presentation/screens/auth/components/social_icon.dart';

class RegisterationMethods extends StatelessWidget {
  const RegisterationMethods({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(),
              ),
              Text("OR"),
              Expanded(
                child: Divider(),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialIcon(icon: "asset/img/facebook.png",), 
              SocialIcon(icon:"asset/img/instgram.png",),
               SocialIcon(icon:"asset/img/google.png",)
              ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}

