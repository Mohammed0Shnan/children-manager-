import 'package:flutter/cupertino.dart';
import 'package:child_app/data/models/child_response.dart';
import 'package:child_app/data/repositories/child_repository.dart';
import 'package:rxdart/rxdart.dart';

class ChildByIdBloC {
  final ChildRepository repository = ChildRepository();
  final BehaviorSubject<ChildResponse> _subject = BehaviorSubject();

  getChild(String id) async {
    ChildResponse response = await repository.getChildById(id);
    _subject.sink.add(response);
  }

  void drainStream(){
    _subject.value = null;
  }

  @mustCallSuper
  void despose(){
    _subject.drain();
    subject.close();
  }
  BehaviorSubject get subject => _subject;

}

final ChildByIdBloC childByIdBloC = ChildByIdBloC();
