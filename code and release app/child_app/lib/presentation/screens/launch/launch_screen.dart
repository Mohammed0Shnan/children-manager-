import 'package:flutter/material.dart';

import 'package:child_app/presentation/screens/launch/components/launch_body.dart';


class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LaunchBody(),
    );
  }
}
