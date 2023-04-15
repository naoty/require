import 'package:require/src/subject.dart';

extension StringHasLengthGreaterThanOrEqualToRequirement on Subject<String> {
  Subject<String> hasLengthGreaterThanOrEqualTo(int length) {
    if (value.length < length) {
      throw StringLengthGreaterThanOrEqualToRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }
}

class StringLengthGreaterThanOrEqualToRequired implements Exception {
  final String _value;
  final int _length;
  final String? _label;

  StringLengthGreaterThanOrEqualToRequired({
    required String value,
    required int length,
    String? label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label('$_value') is required to have length greater than or equal to $_length";
    } else {
      return "'$_value' is required to have length greater than or equal to $_length";
    }
  }
}
