import 'package:flutter/material.dart';

Widget buildLoadingWidget() {
  return Center(
    child:SizedBox(
      height: 40,
      width: 40,
      child:CircularProgressIndicator(
        strokeWidth: 5,
        
      )
    )
  );
}
