import 'package:require/src/subject.dart';

extension StringHasLengthRequirement on Subject<String> {
  Subject<String> hasLength(int length) {
    if (value.length == length) {
      throw StringLengthRequired(value: value, length: length, label: label);
    }
    return this;
  }
}

class StringLengthRequired implements Exception {
  final String _value;
  final int _length;
  final String _label;

  StringLengthRequired({
    required String value,
    required int length,
    required String label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() => "$_label('$_value') is required to have length $_length";
}
