import 'package:flutter/material.dart';
import 'package:child_app/business_logic/blocs/user_bloc.dart';
import 'package:child_app/presentation/screens/auth/components/login_body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoginBody(),
    );
  }
  @override
  void dispose() { 
    userBloC.despose();
  }
}