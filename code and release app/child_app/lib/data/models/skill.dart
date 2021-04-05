
class Skill{
  final int id;
  final String name;
  final String description;
  final String type;
  final double point;
  final String typeName;

  Skill({this.id,this.name,this.description,this.type,this.point,this.typeName});
  Skill.fromJson(Map<String,dynamic> json):
    this.id = json['id'],
    this.name = json['name'],
    this.description = json['description'],
    this.type = json['type'],
    this.point = json['point'],
    this.typeName = json['typeName'];}