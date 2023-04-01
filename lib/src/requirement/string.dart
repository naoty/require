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

  Subject<String> hasLength(int length) {
    if (value.length == length) {
      throw StringLengthRequired(value: value, length: length);
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

  Subject<String> startsWith(String prefix) {
    if (!value.startsWith(prefix)) {
      throw StringPrefixRequired(value: value, prefix: prefix);
    }
    return this;
  }

  Subject<String> endsWith(String suffix) {
    if (!value.endsWith(suffix)) {
      throw StringSuffixRequired(value: value, suffix: suffix);
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
  final int _length;

  StringLengthRequired({required String value, required int length})
      : _value = value,
        _length = length;

  @override
  String toString() => "'$_value' is required to have a length of $_length";
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

class StringPrefixRequired implements Exception {
  final String _value;
  final String _prefix;

  StringPrefixRequired({required String value, required String prefix})
      : _value = value,
        _prefix = prefix;

  @override
  String toString() => "'$_value' is required to start with '$_prefix'";
}

class StringSuffixRequired implements Exception {
  final String _value;
  final String _suffix;

  StringSuffixRequired({required String value, required String suffix})
      : _value = value,
        _suffix = suffix;

  @override
  String toString() => "'$_value' is required to end with '$_suffix'";
}
