import 'package:require/src/subject.dart';

extension NullabilityRequirement<T> on Subject<T?> {
  Subject<T?> isNull() {
    if (value != null) {
      throw NullabilityRequired(value: value, label: label);
    }
    return this;
  }
}

class NullabilityRequired<T> implements Exception {
  final T? _value;
  final String _label;

  NullabilityRequired({required T? value, required String label})
      : _value = value,
        _label = label;

  @override
  String toString() {
    final valueString = _value is String ? "'$_value'" : _value;
    return "$_label($valueString) is required to be null";
  }
}
