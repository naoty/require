import 'package:require/require.dart';

extension IterableRequirement on Subject<Iterable> {
  Subject<Iterable> isEmpty() {
    if (value.isNotEmpty) {
      throw EmptyIterableRequired(value: value);
    }
    return this;
  }

  Subject<Iterable> isNotEmpty() {
    if (value.isEmpty) {
      throw NotEmptyIterableRequired(value: value);
    }
    return this;
  }

  Subject<Iterable> hasLength(int length) {
    if (value.length != length) {
      throw IterableLengthRequired(value: value, length: length);
    }
    return this;
  }
}

class EmptyIterableRequired implements Exception {
  final Iterable _value;

  EmptyIterableRequired({required Iterable value}) : _value = value;

  @override
  String toString() => "$_value is required to be empty";
}

class NotEmptyIterableRequired implements Exception {
  final Iterable _value;

  NotEmptyIterableRequired({required Iterable value}) : _value = value;

  @override
  String toString() => "$_value is required to be not empty";
}

class IterableLengthRequired implements Exception {
  final Iterable _value;
  final int _length;

  IterableLengthRequired({required Iterable value, required int length})
      : _value = value,
        _length = length;

  @override
  String toString() => "$_value is required to have length $_length";
}
