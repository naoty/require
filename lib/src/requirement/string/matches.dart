import 'package:require/src/subject.dart';

extension StringMatchingRequirement on Subject<String> {
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
