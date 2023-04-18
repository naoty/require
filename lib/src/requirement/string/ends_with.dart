import 'package:require/src/subject.dart';

extension StringSuffixRequirement on Subject<String> {
  Subject<String> endsWith(String suffix) {
    if (!value.endsWith(suffix)) {
      throw StringSuffixRequired(value: value, suffix: suffix, label: label);
    }
    return this;
  }
}

class StringSuffixRequired implements Exception {
  final String _value;
  final String _suffix;
  final String _label;

  StringSuffixRequired({
    required String value,
    required String suffix,
    required String label,
  })  : _value = value,
        _suffix = suffix,
        _label = label;

  @override
  String toString() => "$_label('$_value') is required to end with '$_suffix'";
}
