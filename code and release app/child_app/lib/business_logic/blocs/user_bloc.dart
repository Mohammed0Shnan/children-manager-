
import 'package:child_app/data/models/child.dart';
import 'package:child_app/data/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:child_app/data/models/user_response.dart';
import 'package:child_app/data/repositories/user_repository.dart';
import 'package:rxdart/subjects.dart';


class UserBloC {
 
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _subject = BehaviorSubject();
 // static final SharedPrefrences _sharedPrefrences = SharedPrefrences();
  UserBloC(){
    _subject.value=null;
   //_subject.add(UserResponse(token: null ,error: ''));
   // _sharedPrefrences.getString('child_token').then((value) {
    //   _subject.add(UserResponse(token: value.toString(),error: null));
   // });
    
    
  }
Future<UserResponse> login(User user)async{

 //UserResponse userResponse =   await _repository.login(user);
await Future.delayed(Duration(seconds: 2));
 //_subject.sink.add(UserResponse(token: 'w8432y5r98hfuwne',error: ''));


  return UserResponse(token: 'w8432y5r98hfuwne',error: '',child: Child(name: 'mohammed',points: 100,gender: 'male',dob: DateTime.now(),id: 10));// userResponse;

  }

  
  logout()async{
  //   _sharedPrefrences.setString('child_token',null);
  _subject.sink.add(UserResponse(token:null,error: ''));
  
  }

  drainStream(){
    _subject.stream.drain();
  }
  @mustCallSuper
despose(){

  _subject.close();
}
  BehaviorSubject<UserResponse> get subject => _subject;

  Future<UserResponse> getUser()async {
       // _sharedPrefrences.getString('child_token').then((value) {
    //   _subject.add(UserResponse(token: value.toString(),error: null));
   // });
   await Future.delayed(Duration(seconds: 2));
   _subject.sink.add( UserResponse(token:'fasdfwf',error: '',child:Child(name: 'mohammed',points: 100,gender: 'male',dob: DateTime.now(),id: 10)));
   return UserResponse();
  }

  register(User user)async {
   UserResponse userResponse =   await _repository.register(user);
 return userResponse;
  }

}
 final UserBloC userBloC = UserBloC();
