import 'package:flutter/material.dart';
import 'package:child_app/presentation/screens/auth/components/signup_body.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SignupBody(),
    );
  }
}