

class Behavior{
  final int id;
  final String name;
  final String description;
  final String type;
  final double point;
  final String typeName;

  Behavior({this.id,this.name,this.description,this.type,this.point,this.typeName});
  Behavior.fromJson(Map<String,dynamic> json):
    this.id = json['id'],
    this.name = json['name'],
    this.description = json['description'],
    this.type = json['type'],
    this.point = json['points'],
    this.typeName = json['typeName'];
}