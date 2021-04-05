import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:child_app/business_logic/blocs/user_bloc.dart';
import 'package:child_app/util/size_config.dart';

Widget myDrawer(BuildContext context){
  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[Colors.purple[900],Colors.purple[300]],
  
        )
      ),
          child: Column(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top:10),
            height: SizeConfig.screenHeight*0.2,
            width: double.infinity,
           child: SvgPicture.asset( "asset/icons/undraw_toy_car_7umw.svg",
              height: SizeConfig.screenHeight*0.25,
              fit: BoxFit.contain,
),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Divider(
              color: Colors.white,

            ),
          ),
          Expanded(
            child: Container(
                   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
             child: ListView(
               children: <Widget>[
                 ListTile(
                   onTap: (){
                     Navigator.pushNamed(context, '/childs');
                   },
                   title: Text(
                     "ادارة الأطفال",
                     style: TextStyle(
                       fontSize: 22,
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                 ),
                 SizedBox(height: 10,),
                 ListTile(
                   onTap: (){
                   Navigator.pushNamed(context, '/global_manage');
                   },
                   title: Text(
                     "ادارة عامة",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 22,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                 ),
                                  SizedBox(height: 10,),
                 ListTile(
                   onTap: () async{
                  await   userBloC.logout();
                   },
                   title: Text(
                     'خروج',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 22,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   trailing: Icon(Icons.close, color: Colors.white,),
                 ),
               ],
             ),
            ),
          )
        ],
      ),
    )
  );

}
