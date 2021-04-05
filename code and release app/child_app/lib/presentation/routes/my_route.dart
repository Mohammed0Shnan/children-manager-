import 'package:flutter/material.dart';
import 'package:child_app/presentation/screens/add_child/add_child_screen.dart';
import 'package:child_app/presentation/screens/auth/login_screen.dart';
import 'package:child_app/presentation/screens/auth/signup_screen.dart';
import 'package:child_app/presentation/screens/childs/childs_screen.dart';
import 'package:child_app/presentation/screens/items_manage/add_item_screen.dart';

import 'package:child_app/presentation/screens/items_manage/global_manag_screen.dart';
import 'package:child_app/presentation/screens/launch/launch_screen.dart';
import 'package:child_app/presentation/screens/menu_dashboard/menu_dashboard_screen.dart';
import 'package:child_app/wrapper.dart';


class MyRoute {
  Route generatedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Wrapper());
        break;
      case '/lunch':
        return MaterialPageRoute(builder: (_) => LaunchScreen());
        break;

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupScreen());
        break;
      case '/app':
        return MaterialPageRoute(builder: (_) => MenuDashBoard());
        break;
      case '/childs':
        return MaterialPageRoute(builder: (_) => ChildsScreen());
        break;

      case '/addchild':
        return MaterialPageRoute(builder: (_) => AddScreen());
        break;
      case '/global_manage':
        return MaterialPageRoute(builder: (_) => GlobalManageScreen());
        break;
              case '/add_item':
        return MaterialPageRoute(builder: (_) => AddItemScreen());
        break;
      default:
        return null;
    }
  }
}
