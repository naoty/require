import 'package:require/src/subject.dart';

extension IterableLessLengthRequirement<T> on Subject<Iterable<T>> {
  Subject<Iterable<T>> hasLengthLessThan(int length) {
    if (value.length >= length) {
      throw IterableLessLengthRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }
}

class IterableLessLengthRequired implements Exception {
  final Iterable _value;
  final int _length;
  final String? _label;

  IterableLessLengthRequired({
    required Iterable value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to have length less than $_length";
    } else {
      return "$_value is required to have length less than $_length";
    }
  }
}
