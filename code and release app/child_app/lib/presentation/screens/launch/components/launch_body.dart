import 'package:child_app/data/models/user_response.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:child_app/business_logic/blocs/user_bloc.dart';
import 'package:child_app/presentation/widgets/background.dart';
import 'package:child_app/presentation/widgets/loading_widget.dart';
import 'package:child_app/presentation/widgets/rounded_button.dart';
import 'package:child_app/util/size_config.dart';


class LaunchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("مرحبا",
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
              height: 50,
            ),
              FutureBuilder<UserResponse>(
              future: userBloC.getUser(),
              builder: (context,AsyncSnapshot<UserResponse> s){
                if(s.connectionState == ConnectionState.waiting){
                  return buildLoadingWidget();
                }else
                return SizedBox.shrink();
              })
          ],
        ),
      ),
    );
  }
}
