import 'package:require/require.dart';

const toBeEmpty = _EmptyMatcher();

class _EmptyMatcher extends Matcher<Object> {
  const _EmptyMatcher();

  @override
  Exception? match(Object value) {
    if (value is String && value.isNotEmpty) {
      return EmptyStringException(value: value);
    }

    if (value is Iterable && value.isNotEmpty) {
      return EmptyIterableException(value: value);
    }

    return null;
  }
}

class EmptyStringException implements Exception {
  final String value;

  EmptyStringException({required this.value});

  @override
  String toString() => "required '$value' to be empty.";
}

class EmptyIterableException implements Exception {
  final Iterable value;

  EmptyIterableException({required this.value});

  @override
  String toString() => 'required $value to be empty.';
}
