import 'package:require/src/subject.dart';

extension StringHasLengthLessThanOrEqualToRequirement on Subject<String> {
  Subject<String> hasLengthLessThanOrEqualTo(int length) {
    if (value.length > length) {
      throw StringLengthLessThanOrEqualToRequired(
        value: value,
        length: length,
        label: label,
      );
    }
    return this;
  }
}

class StringLengthLessThanOrEqualToRequired implements Exception {
  final String _value;
  final int _length;
  final String _label;

  StringLengthLessThanOrEqualToRequired({
    required String value,
    required int length,
    required String label,
  })  : _value = value,
        _length = length,
        _label = label;

  @override
  String toString() =>
      "$_label('$_value') is required to have length less than or equal to $_length";
}
