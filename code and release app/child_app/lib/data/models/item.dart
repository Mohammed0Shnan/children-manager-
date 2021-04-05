import 'package:child_app/data/models/behavior.dart';
import 'package:child_app/data/models/goal.dart';
import 'package:child_app/data/models/skill.dart';

class Item{

  final List<Behavior> behaviors;
  final List<Goal> goals;
  final List<Skill> skills;

  Item( this.behaviors, this.goals, this.skills);

  Item.fromJson(Map json):
  this.behaviors = (json['behaviours'] == null)?null: (json['behaviours'] as List).map((e) => Behavior.fromJson(e)).toList(),
  this.goals = (json['goals'] == null)?null: (json['goals'] as List).map((e) => Goal.fromJson(e)).toList(),
  this.skills = (json['skills'] == null)?null: (json['skills'] as List).map((e) => Skill.fromJson(e)).toList();

}