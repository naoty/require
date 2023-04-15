import 'package:require/src/subject.dart';

extension NonEmptyIterableRequirement<T> on Subject<Iterable<T>> {
  Subject<Iterable<T>> isNotEmpty() {
    if (value.isEmpty) {
      throw NonEmptyIterableRequired(value: value, label: label);
    }
    return this;
  }
}

class NonEmptyIterableRequired implements Exception {
  final Iterable _value;
  final String? _label;

  NonEmptyIterableRequired({required Iterable value, String? label})
      : _value = value,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to be not empty";
    } else {
      return "$_value is required to be not empty";
    }
  }
}
