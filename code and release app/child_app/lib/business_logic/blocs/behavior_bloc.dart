


import 'package:child_app/data/models/behavior_response.dart';
import 'package:child_app/data/repositories/behavior_repository.dart';
import 'package:rxdart/rxdart.dart';

class BehaviorBloC{
  final BehaviorRepository _repository = BehaviorRepository();
  final BehaviorSubject<BehaviorResponse> _subject = BehaviorSubject();

  getBehaviours()async{
    BehaviorResponse response = await _repository.getBevaviours();
    print(response.behaviours);
    _subject.sink.add(response);
  }

  void dispose(){
    _subject.drain();
    _subject.close();
  }
  BehaviorSubject<BehaviorResponse> get subject => _subject;
}

final BehaviorBloC behaviorBloC = BehaviorBloC();
