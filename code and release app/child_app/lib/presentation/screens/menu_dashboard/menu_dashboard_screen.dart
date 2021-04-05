
import 'package:child_app/business_logic/blocs/behavior_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:child_app/business_logic/blocs/child_bloc.dart';
import 'package:child_app/business_logic/blocs/user_bloc.dart';
import 'package:child_app/presentation/screens/home/home_screen.dart';
import 'package:child_app/presentation/screens/menu_dashboard/components/header.dart';
import 'package:child_app/presentation/screens/menu_dashboard/components/my_drawer.dart';
import 'package:child_app/presentation/screens/statistics/statistics_screen.dart';

class MenuDashBoard extends StatefulWidget {

  const MenuDashBoard({Key key}) : super(key: key);

  @override
  _MenuDashBoardState createState() => _MenuDashBoardState();
}

class _MenuDashBoardState extends State<MenuDashBoard> with WidgetsBindingObserver{

@override
void initState() { 
  super.initState();
      WidgetsBinding.instance.addObserver(this);
          behaviorBloC.getBehaviours();

}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    
    userBloC.despose();
    childBloC.dispose();
  }
@override
void dispose() { 
  
  super.dispose();
}
  int currentIndex = 1;
  final tabs = [
  
   StatisticsScreen(types: ['عامة',' مخصصة'],),
     HomeScreen(),
   
];
 final titles=[ 'الاحصائيات','الصفحة الرئيسية',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Colors.purple[900],
        elevation: 0,
        leading: Builder(
          builder: (context)=>
                  IconButton(
            icon: Icon(Icons.settings),
            onPressed: ()=>Scaffold.of(context).openDrawer(),
          ),
        ),
        title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 IconButton(
                      icon: Icon(Icons.notifications,
                          size: 27, color: Colors.white),
                      onPressed: () {},
                    ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                   titles[currentIndex],
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
      ),
     drawer: myDrawer(context),
      
        bottomNavigationBar: ClipRRect(

      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomNavigationBar(
          elevation: 10,
          iconSize: 30,
          currentIndex: currentIndex,
          backgroundColor: Colors.purple[500],
          selectedItemColor: Colors.white,
          onTap: (index){
          
            setState(() {
              currentIndex = index;
            });
            
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding:EdgeInsets.only(top:5),
                child: Icon(EvaIcons.layers)),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding:EdgeInsets.only(top:5),
                child: Icon(EvaIcons.home)),
              title: SizedBox.shrink(),
            ),
        
          ],
        ),
    ),
        backgroundColor: Colors.white,
        body:Column(
          children: <Widget>[
            Header(),
            tabs[currentIndex]
          ],
        ) );
  }
}


