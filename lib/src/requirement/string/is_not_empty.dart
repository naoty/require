import 'package:require/src/subject.dart';

extension NonEmptyStringRequirement on Subject<String> {
  Subject<String> isNotEmpty() {
    if (value.isEmpty) {
      throw NotEmptyStringRequired(value: value, label: label);
    }
    return this;
  }
}

class NotEmptyStringRequired implements Exception {
  final String _value;
  final String _label;

  NotEmptyStringRequired({required String value, required String label})
      : _value = value,
        _label = label;

  @override
  String toString() => "$_label('$_value') is required to be not empty";
}
