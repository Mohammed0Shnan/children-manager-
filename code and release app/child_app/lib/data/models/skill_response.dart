
import 'package:child_app/data/models/behavior.dart';



class SkillResponse{
  final List<Behavior> behaviours;
  final String error;

  SkillResponse.fromJson(Map json):
   this.behaviours = (json['behaviours'] as List).map((e) => Behavior.fromJson(e)).toList(),
   this.error = '';

   SkillResponse.withError(String errorValue):
   this.behaviours = null ,
   this.error =errorValue;


}