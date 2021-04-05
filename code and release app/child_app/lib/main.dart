import 'package:flutter/material.dart';
import 'package:child_app/presentation/routes/my_route.dart';



void main() {
  runApp(MyApp());
}

class  MyApp extends StatelessWidget {
  final MyRoute _route = MyRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Children App',
      onGenerateRoute: _route.generatedRoute,
      
    );
  }
}



