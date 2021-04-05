import 'package:flutter/material.dart';
import 'package:child_app/data/models/child_response.dart';
import 'package:child_app/data/repositories/child_repository.dart';
import 'package:rxdart/subjects.dart';

class ChildCrudBloC  {
  final ChildRepository _repository = ChildRepository();
  final BehaviorSubject<ChildResponse> _subject = BehaviorSubject();
  

   addChild(child) async {

    // ChildResponse response = await _repository.addChild(child);
    await Future.delayed(Duration(seconds: 1));
    _subject.sink.add( ChildResponse([child],''));

 }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void despose() {
    _subject.drain();
    subject.close();
  }

  BehaviorSubject<ChildResponse> get subject => _subject;
}

