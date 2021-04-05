

import 'package:child_app/data/models/item.dart';

class ItemResponse{

  final Item items;
  final String error;
  ItemResponse({this.items,this.error});
  ItemResponse.fromJson(Map json):
   this.items = Item.fromJson(json),
   this.error = '';

   ItemResponse.withError(String errorValue):
   this.items = null ,
   this.error =errorValue;

}