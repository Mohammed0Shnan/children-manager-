import 'package:flutter/cupertino.dart';
import 'package:child_app/data/models/child_detile_response.dart';
import 'package:child_app/data/repositories/child_detile_repository.dart';
import 'package:rxdart/rxdart.dart';

class ChildDetilBloC{
  final ChildDetileRepository _repository = ChildDetileRepository();
  final BehaviorSubject<ChildDetileResponse> _subject = BehaviorSubject<ChildDetileResponse>();

  getBehaviorById(int id) async {
    ChildDetileResponse response = await _repository.getChildDetile(id);
    _subject.sink.add(response);
  }

drainStream(){
  _subject.value = null;
}
@mustCallSuper
  void despose() {
    _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ChildDetileResponse> get subject => _subject;
}

final ChildDetilBloC childDetilBloC = ChildDetilBloC();