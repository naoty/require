import 'package:require/src/subject.dart';

extension IterableHasLengthRequirement<T> on Subject<Iterable<T>> {
  Subject<Iterable<T>> hasLength(int length) {
    if (value.length != length) {
      throw IterableLengthRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }
}

class IterableLengthRequired implements Exception {
  final Iterable _value;
  final int _length;
  final String? _label;

  IterableLengthRequired({
    required Iterable value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label($_value) is required to have length $_length";
    } else {
      return "$_value is required to have length $_length";
    }
  }
}
