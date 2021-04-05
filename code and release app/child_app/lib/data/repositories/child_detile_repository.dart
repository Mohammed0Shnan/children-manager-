import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:child_app/data/models/child_detile_response.dart';
import 'package:child_app/util/dume_data.dart';

class ChildDetileRepository {
  static final  mainUrl = '';
  static final  getBehaviorUrl = '$mainUrl/';
  static final  getBehaviorByIdUrl = '$mainUrl/';


  Future<ChildDetileResponse> getChildDetile(int id) async {
         return await Future.delayed(Duration(seconds: 2), () {
        ChildDetileResponse result1 = ChildDetileResponse.fromJson(apiitemsResult);
        return result1;
      });
    // try {
    //   http.Response response = await http.get(getBehaviorByIdUrl);
    //   ChildDetileResponse childDetileResponse =
    //       ChildDetileResponse.fromJson(json.decode(response.body));
    //   return childDetileResponse;
    // } catch (errorValue, stackTrace) {
    //   print(
    //       'Error in child detile by id fetching , Error : $errorValue , and trace : $stackTrace ');
    //   return ChildDetileResponse.withError(errorValue);
    // }
  
}}
