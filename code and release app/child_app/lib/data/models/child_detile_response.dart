
import 'package:child_app/data/models/child_detil.dart';

class ChildDetileResponse{
  final ChildDetilModel detiles;
  final String error;

  ChildDetileResponse.fromJson(Map json):
   this.detiles = ChildDetilModel.fromJson(json),
   this.error = '';

   ChildDetileResponse.withError(String errorValue):
   this.detiles = null ,
   this.error =errorValue;


}