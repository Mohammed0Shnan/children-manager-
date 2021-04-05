class ItemModel{
  final int id;
  final String name;
  final String description;
  final String type;
  final double points;
  final String typeName;

  ItemModel({this.id,this.name,this.description,this.type,this.points,this.typeName});
  ItemModel.fromJson(Map<String,dynamic> json):
    this.id = json['id'],
    this.name = json['name'],
    this.description = json['description'],
    this.type = json['type'],
    this.points = json['points'],
    this.typeName = json['typeName'];
}