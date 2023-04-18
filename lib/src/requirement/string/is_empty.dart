import 'package:require/src/subject.dart';

extension EmptyStringRequirement on Subject<String> {
  Subject<String> isEmpty() {
    if (value.isNotEmpty) {
      throw EmptyStringRequired(value: value, label: label);
    }
    return this;
  }
}

class EmptyStringRequired implements Exception {
  final String _value;
  final String _label;

  EmptyStringRequired({required String value, required String label})
      : _value = value,
        _label = label;

  @override
  String toString() => "$_label('$_value') is required to be empty";
}
