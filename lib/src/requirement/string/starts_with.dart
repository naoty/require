import 'package:require/src/subject.dart';

extension StringPrefixRequirement on Subject<String> {
  Subject<String> startsWith(String prefix) {
    if (!value.startsWith(prefix)) {
      throw StringPrefixRequired(value: value, prefix: prefix, label: label);
    }
    return this;
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
