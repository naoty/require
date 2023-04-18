import 'package:require/src/subject.dart';

extension NumLessThanOrEqualToRequirement on Subject<num> {
  Subject<num> isLessThanOrEqualTo(num value) {
    if (this.value > value) {
      throw NumLessThanOrEqualToRequired(
        value: this.value,
        required: value,
        label: label,
      );
    }
    return this;
  }
}

class NumLessThanOrEqualToRequired implements Exception {
  final num _value;
  final num _required;
  final String _label;

  NumLessThanOrEqualToRequired({
    required num value,
    required num required,
    required String label,
  })  : _value = value,
        _required = required,
        _label = label;

  @override
  String toString() =>
      "$_label($_value) is required to be less than or equal to $_required";
}
