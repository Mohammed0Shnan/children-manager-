class Child {
  final int id;
  final String name;
  final double points;
  final String gender;
  final DateTime dob;

  Child({this.id,this.name,this.points,this.gender,this.dob});

  Child.fromJson(Map<String, dynamic> json):
  this.id = json['id'],
  this.name = json['name'],
  this.points = json['points'],
  this.gender = json['gender'],
  this.dob = json['dob']
  ;

}