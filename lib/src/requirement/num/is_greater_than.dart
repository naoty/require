import 'package:require/src/subject.dart';

extension NumGreaterThanRequirement on Subject<num> {
  Subject<num> isGreaterThan(num value) {
    if (this.value <= value) {
      throw NumGreaterThanRequired(
        value: this.value,
        required: value,
        label: label,
      );
    }
    return this;
  }
}

class NumGreaterThanRequired implements Exception {
  final num _value;
  final num _required;
  final String? _label;

  NumGreaterThanRequired({
    required num value,
    required num required,
    String? label,
  })  : _value = value,
        _required = required,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to be greater than $_required";
    } else {
      return "$_value is required to be greater than $_required";
    }
  }
}
