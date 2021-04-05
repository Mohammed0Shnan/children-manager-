
class Goal{
  final int id;
  final String name;
  final String description;
  final String type;
  final double point;
  final String typeName;

  Goal({this.id,this.name,this.description,this.type,this.point,this.typeName});
  Goal.fromJson(Map<String,dynamic> json):
    this.id = json['id'],
    this.name = json['name'],
    this.description = json['description'],
    this.type = json['type'],
    this.point = json['point'],
    this.typeName = json['typeName'];}