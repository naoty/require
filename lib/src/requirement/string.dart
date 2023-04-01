import 'package:require/src/subject.dart';

extension StringRequirement on Subject<String> {
  Subject<String> isEmpty() {
    if (value.isNotEmpty) {
      throw EmptyStringRequired(value: value);
    }
    return this;
  }

  Subject<String> isNotEmpty() {
    if (value.isEmpty) {
      throw NotEmptyStringRequired(value: value);
    }
    return this;
  }

  Subject<String> hasLength({int min = 0, required int max}) {
    if (value.length < min || max < value.length) {
      throw StringLengthRequired(value: value, min: min, max: max);
    }
    return this;
  }

  Subject<String> matches(Pattern pattern) {
    if (pattern is RegExp) {
      if (pattern.matchAsPrefix(value) == null) {
        throw StringMatchRequired(value: value, pattern: pattern);
      }
    } else if (pattern is String) {
      final regexp = RegExp(pattern);
      if (regexp.matchAsPrefix(value) == null) {
        throw StringMatchRequired(value: value, pattern: pattern);
      }
    }
    return this;
  }
}

class EmptyStringRequired implements Exception {
  final String _value;

  EmptyStringRequired({required String value}) : _value = value;

  @override
  String toString() => "'$_value' is required to be empty";
}

class NotEmptyStringRequired implements Exception {
  final String _value;

  NotEmptyStringRequired({required String value}) : _value = value;

  @override
  String toString() => "'$_value' is required not to be empty";
}

class StringLengthRequired implements Exception {
  final String _value;
  final int _min;
  final int _max;

  StringLengthRequired(
      {required String value, required int min, required int max})
      : _value = value,
        _min = min,
        _max = max;

  @override
  String toString() =>
      "'$_value' is required to have length between $_min and $_max";
}

class StringMatchRequired implements Exception {
  final String _value;
  final Pattern _pattern;

  StringMatchRequired({required String value, required Pattern pattern})
      : _value = value,
        _pattern = pattern;

  @override
  String toString() => "'$_value' is required to match '$_pattern'";
}
