import 'package:require/src/subject.dart';

extension EmptyIterableRequirement<T> on Subject<Iterable<T>> {
  Subject<Iterable<T>> isEmpty() {
    if (value.isNotEmpty) {
      throw EmptyIterableRequired(value: value, label: label);
    }
    return this;
  }
}

class EmptyIterableRequired implements Exception {
  final Iterable _value;
  final String _label;

  EmptyIterableRequired({required Iterable value, required String label})
      : _value = value,
        _label = label;

  @override
  String toString() => "$_label($_value) is required to be empty";
}
