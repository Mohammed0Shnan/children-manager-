import 'package:child_app/business_logic/blocs/user_bloc.dart';
import 'package:child_app/data/models/user.dart';
import 'package:child_app/presentation/widgets/error_widget.dart';
import 'package:child_app/presentation/widgets/rounded_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:child_app/presentation/screens/auth/components/already_anaccount_cheak.dart';
import 'package:child_app/presentation/screens/auth/components/registeration_method.dart';
import 'package:child_app/presentation/widgets/background.dart';
import 'package:child_app/presentation/widgets/rounded_input_feild.dart';
import 'package:child_app/util/size_config.dart';

class SignupBody extends StatefulWidget {
  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  bool active = true;
  String _email,_password,_confirmPass;
  @override
  Widget build(BuildContext context) {
    return Background(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(EvaIcons.arrowBack,size:28 ,),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("تسجيل",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 5 * SizeConfig.titleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset( "asset/icons/undraw_toy_car_7umw.svg",
            height: SizeConfig.screenHeight*0.35,
)
,
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
                    _password =value;
                  });
              },
            ),
             SizedBox(
              height: 15,
            ),
            RoundedInputFeild(
              hintText: "تأكيد كلمة السر",
              icon: Icons.confirmation_number,
              isSecure: true,
              valueChanged: (value) {
                  setState(() {
                    _confirmPass =value;
                  });
              },
            ),
            SizedBox(
              height: 20,
            ),
            AlreadyAnAccountCheak(
              isLogin: false,
              onPress: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            SizedBox(
              height: 10,
            ),
                     RoundedButton(
                        text: 'تسجيل',
                        onPress: () async {
                         
                          if(_confirmPass != _password)
                          {
                               buildErrorWidget(context, error: 'خطأ بالحقول المدخلة ');
                          }
                           setState(() {
                            active = !active;
                          });
                          await userBloC.register(User(email: _email,password: _password)).then((value) {
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
            RegisterationMethods()
          ],
        ),
      ),
    );
  }
}

