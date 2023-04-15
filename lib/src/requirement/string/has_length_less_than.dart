import 'package:require/src/subject.dart';

extension StringHasLengthLessThanRequirement on Subject<String> {
  Subject<String> hasLengthLessThan(int length) {
    if (value.length >= length) {
      throw StringLengthLessThanRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }
}

class StringLengthLessThanRequired implements Exception {
  final String _value;
  final int _length;
  final String? _label;

  StringLengthLessThanRequired({
    required String value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to have length less than $_length";
    } else {
      return "'$_value' is required to have length less than $_length";
    }
  }
}
