
import 'package:child_app/data/models/behavior_response.dart';
import 'package:child_app/data/repositories/behavior_repository.dart';
import 'package:rxdart/subjects.dart';

class BehaviorByIdBloC {
  final BehaviorRepository _repository = BehaviorRepository();
  final BehaviorSubject<BehaviorResponse> _subject = BehaviorSubject();

  getBehaviorById(int id) async {
    BehaviorResponse response = await _repository.getBehaviorById(id);
    _subject.sink.add(response);
  }

  void despose() {
    _subject.drain();
    _subject.close();
  }

  BehaviorSubject<BehaviorResponse> get subject => _subject;
}

final BehaviorByIdBloC behaviorByIdBloC = BehaviorByIdBloC();
