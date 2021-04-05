import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:child_app/business_logic/blocs/user_bloc.dart';
import 'package:child_app/data/models/user.dart';
import 'package:child_app/presentation/screens/auth/components/already_anaccount_cheak.dart';
import 'package:child_app/presentation/widgets/background.dart';
import 'package:child_app/presentation/widgets/error_widget.dart';
import 'package:child_app/presentation/widgets/loading_widget.dart';
import 'package:child_app/presentation/widgets/rounded_button.dart';
import 'package:child_app/presentation/widgets/rounded_input_feild.dart';
import 'package:child_app/util/size_config.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

bool active = true;

class _LoginBodyState extends State<LoginBody> {
  String _email,_password;
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              
                      SizedBox(
                        height: 20,
                      ),
                      Text("دخول",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 5 * SizeConfig.titleSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(
                        height: 20,
                      ),
                      SvgPicture.asset(
                        "asset/icons/undraw_toy_car_7umw.svg",
                        height: SizeConfig.screenHeight * 0.35,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      RoundedInputFeild(
                          hintText: "ادخل الايميل",
                          icon: Icons.person,
                          valueChanged: (value) {
                            setState(() {
                              _email =value;
                            });
                          },
                          isSecure: false),
                      SizedBox(
                        height: 15,
                      ),
                      RoundedInputFeild(
                        hintText: "ادخل كلمة السر",
                        icon: Icons.lock,
                        isSecure: true,
                        valueChanged: (value) {
                          setState(() {
                            _password=value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RoundedButton(
                        text: 'دخول',
                        onPress: () async {
                          setState(() {
                            active = !active;
                          });
                          await userBloC.login(User(email: _email,password: _password)).then((value) {
                            if (value == null) {
                               buildErrorWidget(context, error: '');
                                        setState(() {
                              active = !active;
                            });
                            } else {
                                   setState(() {
                              active = !active;
                            });
                                 userBloC.subject.sink.add(value);
                     
                            }
                       
                          });
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AlreadyAnAccountCheak(
                        isLogin: true,
                        onPress: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          (active) ? SizedBox.shrink() : Center(child: buildLoadingWidget())
        ],
      ),
    );
  }
}
