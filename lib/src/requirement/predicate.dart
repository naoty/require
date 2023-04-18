import 'package:require/src/subject.dart';

extension PredicateRequirement<T> on Subject<T> {
  Subject<T> predicate(bool Function(T) function, {required String message}) {
    if (!function(value)) {
      throw PredicateRequired(message: message, label: label);
    }
    return this;
  }
}

class PredicateRequired implements Exception {
  final String _message;
  final String _label;

  PredicateRequired({required String message, required String label})
      : _message = message,
        _label = label;

  @override
  String toString() => [_label, _message].join(' ');
}
