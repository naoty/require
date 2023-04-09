import 'package:require/src/subject.dart';

extension StringRequirement on Subject<String> {
  Subject<String> isEmpty() {
    if (value.isNotEmpty) {
      throw EmptyStringRequired(value: value, label: label);
    }
    return this;
  }

  Subject<String> isNotEmpty() {
    if (value.isEmpty) {
      throw NotEmptyStringRequired(value: value, label: label);
    }
    return this;
  }

  Subject<String> hasLength(int length) {
    if (value.length == length) {
      throw StringLengthRequired(value: value, length: length, label: label);
    }
    return this;
  }

  Subject<String> hasLengthGreaterThan(int length) {
    if (value.length <= length) {
      throw StringLengthGreaterThanRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }

  Subject<String> hasLengthGreaterThanOrEqualTo(int length) {
    if (value.length < length) {
      throw StringLengthGreaterThanOrEqualToRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }

  Subject<String> hasLengthLessThan(int length) {
    if (value.length >= length) {
      throw StringLengthLessThanRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }

  Subject<String> hasLengthLessThanOrEqualTo(int length) {
    if (value.length > length) {
      throw StringLengthLessThanOrEqualToRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }

  Subject<String> matches(Pattern pattern) {
    if (pattern is RegExp) {
      if (pattern.matchAsPrefix(value) == null) {
        throw StringMatchRequired(value: value, pattern: pattern, label: label);
      }
    } else if (pattern is String) {
      final regexp = RegExp(pattern);
      if (regexp.matchAsPrefix(value) == null) {
        throw StringMatchRequired(value: value, pattern: pattern, label: label);
      }
    }
    return this;
  }

  Subject<String> startsWith(String prefix) {
    if (!value.startsWith(prefix)) {
      throw StringPrefixRequired(value: value, prefix: prefix, label: label);
    }
    return this;
  }

  Subject<String> endsWith(String suffix) {
    if (!value.endsWith(suffix)) {
      throw StringSuffixRequired(value: value, suffix: suffix, label: label);
    }
    return this;
  }
}

class EmptyStringRequired implements Exception {
  final String _value;
  final String? _label;

  EmptyStringRequired({required String value, String? label})
      : _value = value,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to be empty";
    } else {
      return "'$_value' is required to be empty";
    }
  }
}

class NotEmptyStringRequired implements Exception {
  final String _value;
  final String? _label;

  NotEmptyStringRequired({required String value, String? label})
      : _value = value,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to be not empty";
    } else {
      return "'$_value' is required to be not empty";
    }
  }
}

class StringLengthRequired implements Exception {
  final String _value;
  final int _length;
  final String? _label;

  StringLengthRequired(
      {required String value, required int length, String? label})
      : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to have length $_length";
    } else {
      return "'$_value' is required to have length $_length";
    }
  }
}

class StringLengthGreaterThanRequired implements Exception {
  final String _value;
  final int _length;
  final String? _label;

  StringLengthGreaterThanRequired({
    required String value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to have length greater than $_length";
    } else {
      return "'$_value' is required to have length greater than $_length";
    }
  }
}

class StringLengthGreaterThanOrEqualToRequired implements Exception {
  final String _value;
  final int _length;
  final String? _label;

  StringLengthGreaterThanOrEqualToRequired({
    required String value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to have length greater than or equal to $_length";
    } else {
      return "'$_value' is required to have length greater than or equal to $_length";
    }
  }
}

class StringLengthLessThanRequired implements Exception {
  final String _value;
  final int _length;
  final String? _label;

  StringLengthLessThanRequired({
    required String value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to have length less than $_length";
    } else {
      return "'$_value' is required to have length less than $_length";
    }
  }
}

class StringLengthLessThanOrEqualToRequired implements Exception {
  final String _value;
  final int _length;
  final String? _label;

  StringLengthLessThanOrEqualToRequired({
    required String value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to have length less than or equal to $_length";
    } else {
      return "'$_value' is required to have length less than or equal to $_length";
    }
  }
}

class StringMatchRequired implements Exception {
  final String _value;
  final Pattern _pattern;
  final String? _label;

  StringMatchRequired(
      {required String value, required Pattern pattern, String? label})
      : _value = value,
        _pattern = pattern,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to match '$_pattern'";
    } else {
      return "'$_value' is required to match '$_pattern'";
    }
  }
}

class StringPrefixRequired implements Exception {
  final String _value;
  final String _prefix;
  final String? _label;

  StringPrefixRequired(
      {required String value, required String prefix, String? label})
      : _value = value,
        _prefix = prefix,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to start with '$_prefix'";
    } else {
      return "'$_value' is required to start with '$_prefix'";
    }
  }
}

class StringSuffixRequired implements Exception {
  final String _value;
  final String _suffix;
  final String? _label;

  StringSuffixRequired(
      {required String value, required String suffix, String? label})
      : _value = value,
        _suffix = suffix,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to end with '$_suffix'";
    } else {
      return "'$_value' is required to end with '$_suffix'";
    }
  }
}
