import 'package:require/src/subject.dart';

extension NumGreaterThanOrEqualToRequirement on Subject<num> {
  Subject<num> isGreaterThanOrEqualTo(num value) {
    if (this.value < value) {
      throw NumGreaterThanOrEqualToRequired(
        value: this.value,
        required: value,
        label: label,
      );
    }
    return this;
  }
}

class NumGreaterThanOrEqualToRequired implements Exception {
  final num _value;
  final num _required;
  final String _label;

  NumGreaterThanOrEqualToRequired({
    required num value,
    required num required,
    required String label,
  })  : _value = value,
        _required = required,
        _label = label;

  @override
  String toString() =>
      "$_label($_value) is required to be greater than or equal to $_required";
}
