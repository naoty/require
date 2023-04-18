import 'package:require/src/subject.dart';

extension NumLessThanRequirement on Subject<num> {
  Subject<num> isLessThan(num value) {
    if (this.value >= value) {
      throw NumLessThanRequired(
        value: this.value,
        required: value,
        label: label,
      );
    }
    return this;
  }
}

class NumLessThanRequired implements Exception {
  final num _value;
  final num _required;
  final String _label;

  NumLessThanRequired({
    required num value,
    required num required,
    required String label,
  })  : _value = value,
        _required = required,
        _label = label;

  @override
  String toString() =>
      "$_label($_value) is required to be less than $_required";
}
