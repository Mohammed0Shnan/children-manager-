
import 'package:child_app/data/models/child.dart';

class ChildResponse {
  final List<Child> childs;
  final String error;
  ChildResponse(this.childs, this.error);
  ChildResponse.fromJson(Map json)
      : childs =
            (json['children'] as List).map((e) => Child.fromJson(e)).toList(),
        error = '';

  ChildResponse.withError(String errorValue)
      : childs = null,
        error = errorValue;
}
