import 'package:require/src/subject.dart';

extension IterableLessOrEqualLengthRequirement<T> on Subject<Iterable<T>> {
  Subject<Iterable<T>> hasLengthLessThanOrEqualTo(int length) {
    if (value.length > length) {
      throw IterableLessOrEqualLengthRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }
}

class IterableLessOrEqualLengthRequired implements Exception {
  final Iterable _value;
  final int _length;
  final String? _label;

  IterableLessOrEqualLengthRequired({
    required Iterable value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to have length less than or equal to $_length";
    } else {
      return "$_value is required to have length less than or equal to $_length";
    }
  }
}
