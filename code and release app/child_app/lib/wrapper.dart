import 'package:flutter/material.dart';
import 'package:child_app/presentation/screens/auth/login_screen.dart';
import 'package:child_app/presentation/screens/launch/components/launch_body.dart';
import 'package:child_app/presentation/screens/launch/launch_screen.dart';
import 'package:child_app/presentation/screens/menu_dashboard/menu_dashboard_screen.dart';
import 'package:child_app/presentation/widgets/error_widget.dart';
import 'package:child_app/presentation/widgets/loading_widget.dart';
import 'package:child_app/util/size_config.dart';


import 'business_logic/blocs/user_bloc.dart';
import 'data/models/user_response.dart';



class Wrapper extends StatelessWidget with WidgetsBindingObserver{
  @override
  void initState() { 
    
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    
    userBloC.subject.drain();
  }
  @override
  Widget build(BuildContext context) {


    SizeConfig().init(MediaQuery.of(context).size);

    return StreamBuilder<UserResponse>(
      initialData:userBloC.subject.value,
      stream: userBloC.subject.stream,
      builder: (BuildContext context, AsyncSnapshot<UserResponse> snapshot) {
        if (snapshot.hasData) {
          if(snapshot.data.token !=null)
            return MenuDashBoard();

            return LoginScreen();
          }      
         else
         return LaunchScreen();  
      },
    );
  }
}
