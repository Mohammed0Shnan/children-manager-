
import 'package:child_app/data/models/behavior.dart';

class BehaviorResponse{
  final List<Behavior> behaviours;
  final String error;

  BehaviorResponse.fromJson(Map json):
   this.behaviours = (json['behaviours'] as List).map((e) => Behavior.fromJson(e)).toList(),
   this.error = '';

   BehaviorResponse.withError(String errorValue):
   this.behaviours = null ,
   this.error =errorValue;


}