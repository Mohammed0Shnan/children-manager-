
import 'package:child_app/data/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:child_app/data/models/user_response.dart';
class UserRepository{
  static final mainUrl = '';
  static final loginUrl = '$mainUrl/login';
  static final signupUrl = '$mainUrl/signup';

  Future<UserResponse> login(user) async {
    try{
      http.Response response = await http.get(loginUrl);
      UserResponse userResponse = UserResponse.fromJson(json.decode(response.body));
      return userResponse;
    }catch(errorValue  ,stackTrace){
      print('Error in login , Error : $errorValue , and trace : $stackTrace');
      return UserResponse.withError(errorValue);
    }
  }

  register(User user)async {
        try{
      http.Response response = await http.get(signupUrl);
      UserResponse userResponse = UserResponse.fromJson(json.decode(response.body));
      return userResponse;
    }catch(errorValue  ,stackTrace){
      print('Error in Register , Error : $errorValue , and trace : $stackTrace');
      return UserResponse.withError(errorValue);
    }
  }
  }
  
