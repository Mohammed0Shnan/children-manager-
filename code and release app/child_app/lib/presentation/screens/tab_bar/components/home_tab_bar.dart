// import 'package:flutter/material.dart';


// import 'list_product_by_type.dart';

// class HomeTabBar extends StatefulWidget {
//   final List types;
//   HomeTabBar({this.types});
//   @override
//   _HomeTabBarState createState() => _HomeTabBarState(this.types);
// }

// class _HomeTabBarState extends State<HomeTabBar>
//     with SingleTickerProviderStateMixin {
//   TabController tabController;
//   List types;
//   _HomeTabBarState(this.types);
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     tabController = TabController(vsync: this, length: 3);
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextStyle textStyle = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
//     types = [1, 2, 3];
//     return Container(
//         width: double.infinity,
//         height: 200,
//         child: DefaultTabController(
//           length: 3,
//           initialIndex: 1,
//           child: Scaffold(
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(50),
//               child: AppBar(
//                 backgroundColor: Colors.yellow,
//                 bottom: TabBar(
//                   tabs: types
//                       .map(
//                         (e) => Text("type $e", style: textStyle),
//                       )
//                       .toList(),
//                   controller: tabController,
//                 ),
//               ),
//             ),
//             body: TabBarView(
//                 controller: tabController,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: types.map((e) {
//                   print(e);
//                   return LIstProductByType(
//                     type: e,
//                   );
//                 }).toList()),
//           ),
//         ));
//   }
// }
