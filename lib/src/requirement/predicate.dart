import 'package:require/src/subject.dart';

extension PredicateRequirement<T> on Subject<T> {
  Subject<T> predicate(bool Function(T) function, {required String message}) {
    if (!function(value)) {
      throw PredicateRequired(message);
    }
    return this;
  }
}

class PredicateRequired implements Exception {
  final String _message;

  PredicateRequired(this._message);

  @override
  String toString() {
    return _message;
  }
}
