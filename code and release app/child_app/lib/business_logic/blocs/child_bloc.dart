import 'package:flutter/material.dart';
import 'package:child_app/data/models/child_response.dart';
import 'package:child_app/data/repositories/child_repository.dart';
import 'package:rxdart/rxdart.dart';

class ChildBloC {
  final ChildRepository _childRepository = ChildRepository();
  BehaviorSubject<ChildResponse> _subject = BehaviorSubject();

  getChildren() async {
    ChildResponse _response = await _childRepository.getChildren();
    _subject.sink.add(_response);
  }
  
  

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  dispose() {
    _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ChildResponse> get subject => _subject;


}

final ChildBloC childBloC =ChildBloC();