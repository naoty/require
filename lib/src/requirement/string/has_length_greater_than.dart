import 'package:require/src/subject.dart';

extension StringHasLengthGreaterThanRequirement on Subject<String> {
  Subject<String> hasLengthGreaterThan(int length) {
    if (value.length <= length) {
      throw StringLengthGreaterThanRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }
}

class StringLengthGreaterThanRequired implements Exception {
  final String _value;
  final int _length;
  final String? _label;

  StringLengthGreaterThanRequired({
    required String value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to have length greater than $_length";
    } else {
      return "'$_value' is required to have length greater than $_length";
    }
  }
}
