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
  final String? _label;

  EmptyIterableRequired({required Iterable value, String? label})
      : _value = value,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to be empty";
    } else {
      return "$_value is required to be empty";
    }
  }
}

class NotEmptyIterableRequired implements Exception {
  final Iterable _value;
  final String? _label;

  NotEmptyIterableRequired({required Iterable value, String? label})
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

class IterableLengthRequired implements Exception {
  final Iterable _value;
  final int _length;
  final String? _label;

  IterableLengthRequired({
    required Iterable value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to have length $_length";
    } else {
      return "$_value is required to have length $_length";
    }
  }
}
