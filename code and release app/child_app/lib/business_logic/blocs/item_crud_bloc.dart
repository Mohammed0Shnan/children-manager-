import 'package:child_app/data/models/item_model.dart';
import 'package:child_app/data/models/item_response.dart';
import 'package:child_app/data/repositories/item_repository.dart';
import 'package:flutter/material.dart';
import 'package:child_app/data/models/child_response.dart';
import 'package:child_app/data/repositories/child_repository.dart';
import 'package:rxdart/subjects.dart';

class ItemCrudBloC  {
  final ItemRepository _repository = ItemRepository();
  final BehaviorSubject<ItemModel> _subject = BehaviorSubject();


  addItem(item) async {

   // ItemModel response = await _repository.addItem(item);
    await Future.delayed(Duration(seconds: 1));
    _subject.sink.add(item);

  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void despose() {
    _subject.drain();
    subject.close();
  }

  BehaviorSubject<ItemModel> get subject => _subject;
}
final ItemCrudBloC itemCrudBloC = ItemCrudBloC();