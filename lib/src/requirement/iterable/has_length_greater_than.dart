import 'package:require/src/subject.dart';

extension IterableHasLengthGreaterThanRequirement<T> on Subject<Iterable<T>> {
  Subject<Iterable<T>> hasLengthGreaterThan(int length) {
    if (value.length <= length) {
      throw IterableGreaterLengthRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }
}

class IterableGreaterLengthRequired implements Exception {
  final Iterable _value;
  final int _length;
  final String _label;

  IterableGreaterLengthRequired({
    required Iterable value,
    required int length,
    required String label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() =>
      "$_label($_value) is required to have length greater than $_length";
}
