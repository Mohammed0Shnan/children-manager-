
import 'package:child_app/data/models/behavior.dart';



class GoalResponse{
  final List<Behavior> behaviours;
  final String error;

  GoalResponse.fromJson(Map json):
   this.behaviours = (json['behaviours'] as List).map((e) => Behavior.fromJson(e)).toList(),
   this.error = '';

   GoalResponse.withError(String errorValue):
   this.behaviours = null ,
   this.error =errorValue;


}