import 'package:child_app/data/models/item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:child_app/data/models/item_response.dart';
import 'package:child_app/util/dume_data.dart';

class ItemRepository {
  static final  mainUrl = '';
  static final  getBehaviorUrl = '$mainUrl/';
  static final  getBehaviorByIdUrl = '$mainUrl/';

  Future<ItemResponse> getItems() async {
   
             return await Future.delayed(Duration(seconds: 2), () {
         ItemResponse result1 = ItemResponse.fromJson(apiitemsResult);
     return result1;
      });

    try {
      http.Response response = await http.get(getBehaviorUrl);
      ItemResponse itemResponse =
          ItemResponse.fromJson(json.decode(response.body));
      return itemResponse;
    } catch (errorValue, stackTrace) {
      print(
          'Error in items fetching , Error : $errorValue , and trace : $stackTrace');
      return ItemResponse.withError(errorValue);
    }
  }

  Future<ItemResponse> getItemById(int id) async {
    try {
      http.Response response = await http.get(getBehaviorByIdUrl);
      ItemResponse itemResponse =
          ItemResponse.fromJson(json.decode(response.body));
      return itemResponse;
    } catch (errorValue, stackTrace) {
      print(
          'Error in items by id fitching , Error : $errorValue , and trace : $stackTrace ');
      return ItemResponse.withError(errorValue);
    }
  }

  Future<ItemModel> addItem(item) async {
    try {
      http.Response response = await http.get(getBehaviorByIdUrl);
      ItemModel itemModel =ItemModel.fromJson(json.decode(response.body));

      return itemModel;
    } catch (errorValue, stackTrace) {
      print(
          'Error in items by id fetching , Error : $errorValue , and trace : $stackTrace ');
      return null;
    }
  }

}
