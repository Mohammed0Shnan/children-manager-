import 'package:child_app/data/models/child.dart';

class UserResponse{
  final String token;
  final String error;
  final Child child;
  UserResponse({this.token,this.error,this.child});
  UserResponse.fromJson(Map json):
  this.token = json['token'],
  this.error = '',
  this.child = json['child'];

  UserResponse.withError(errorValue):
  this.token = null , 
  this.child = null,
  this.error = errorValue;
}