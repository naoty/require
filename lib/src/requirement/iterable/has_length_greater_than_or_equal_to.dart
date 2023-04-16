import 'package:require/src/subject.dart';

extension IterableHasLengthGreaterThanOrEqualToRequirement<T>
    on Subject<Iterable<T>> {
  Subject<Iterable<T>> hasLengthGreaterThanOrEqualTo(int length) {
    if (value.length < length) {
      throw IterableGreaterOrEqualLengthRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }
}

class IterableGreaterOrEqualLengthRequired implements Exception {
  final Iterable _value;
  final int _length;
  final String? _label;

  IterableGreaterOrEqualLengthRequired({
    required Iterable value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to have length greater than or equal to $_length";
    } else {
      return "$_value is required to have length greater than or equal to $_length";
    }
  }
}
