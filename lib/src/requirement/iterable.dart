import 'package:require/require.dart';

extension NullableIterableRequirement on Subject<Iterable?> {
  Subject<Iterable?> isNull() {
    if (value != null) {
      throw NullIterableRequired(value: value);
    }
    return this;
  }

  Subject<Iterable> isNotNull() {
    if (value == null) {
      throw NonNullIterableRequired();
    }
    return Subject(value: value!, label: label);
  }

  Subject<Iterable>? ifNotNull() {
    if (value == null) {
      return null;
    }
    return Subject(value: value!, label: label);
  }
}

extension IterableRequirement<T> on Subject<Iterable<T>> {
  Subject<Iterable> isEmpty() {
    if (value.isNotEmpty) {
      throw EmptyIterableRequired(value: value, label: label);
    }
    return this;
  }

  Subject<Iterable> isNotEmpty() {
    if (value.isEmpty) {
      throw NotEmptyIterableRequired(value: value, label: label);
    }
    return this;
  }

  Subject<Iterable> hasLength(int length) {
    if (value.length != length) {
      throw IterableLengthRequired(value: value, length: length);
    }
    return this;
  }

  Subject<Iterable> contains(T element) {
    if (!value.contains(element)) {
      throw IterableContainingRequired(
        value: value,
        element: element,
        label: label,
      );
    }
    return this;
  }
}

class NullIterableRequired implements Exception {
  final Iterable? _value;
  final String? _label;

  NullIterableRequired({required Iterable? value, String? label})
      : _value = value,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to be null";
    } else {
      return "$_value is required to be null";
    }
  }
}

class NonNullIterableRequired implements Exception {
  final String? _label;

  NonNullIterableRequired({String? label}) : _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label is required to be not null";
    } else {
      return "Iterable is required to be not null";
    }
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

class IterableContainingRequired<T> implements Exception {
  final Iterable _value;
  final T _element;
  final String? _label;

  IterableContainingRequired({
    required Iterable value,
    required T element,
    String? label,
  })  : _value = value,
        _element = element,
        _label = label;

  @override
  String toString() {
    final elementString = T is String ? "'$_element'" : "$_element";
    if (_label != null) {
      return "$_label($_value) is required to contain $elementString";
    } else {
      return "$_value is required to contain $elementString";
    }
  }
}
