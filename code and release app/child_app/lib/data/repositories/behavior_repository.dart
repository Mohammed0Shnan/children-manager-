import 'package:child_app/util/dume_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:child_app/data/models/behavior_response.dart';

class BehaviorRepository {
  static final  mainUrl = '';
  static final  getBehaviorUrl = '$mainUrl/';
  static final  getBehaviorByIdUrl = '$mainUrl/';

  Future<BehaviorResponse> getBevaviours() async {
    print('dsdddddddddddddddddddd');
     return await Future.delayed(Duration(seconds: 2), () {
        BehaviorResponse result1 = BehaviorResponse.fromJson(apiBehaviorResult);
        return result1;
      });
    // try {
    //   http.Response response = await http.get(getBehaviorUrl);
    //   BehaviorResponse behaviorResponse =
    //       BehaviorResponse.fromJson(json.decode(response.body));
    //   return behaviorResponse;
    // } catch (errorValue, stackTrace) {
    //   print(
    //       'Error in behaviuors fetching , Error : $errorValue , and trace : $stackTrace');
    //   return BehaviorResponse.withError(errorValue);
    // }
  }

  Future<BehaviorResponse> getBehaviorById(int id) async {
    try {
      http.Response response = await http.get(getBehaviorByIdUrl);
      BehaviorResponse behaviorResponse =
          BehaviorResponse.fromJson(json.decode(response.body));
      return behaviorResponse;
    } catch (errorValue, stackTrace) {
      print(
          'Error in behavoir by id ftchinf , Error : $errorValue , and trace : $stackTrace ');
      return BehaviorResponse.withError(errorValue);
    }
  }
}
