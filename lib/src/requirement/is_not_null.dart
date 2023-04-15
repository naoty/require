import 'package:require/src/subject.dart';

extension NonNullabilityRequirement<T> on Subject<T?> {
  Subject<T> isNotNull() {
    if (value == null) {
      throw NonNullabilityRequired(label: label);
    }
    return Subject(value: value as T, label: label);
  }
}

class NonNullabilityRequired implements Exception {
  final String? _label;

  NonNullabilityRequired({String? label}) : _label = label;

  @override
  String toString() {
    if (_label != null) {
      return "$_label(null) is required to be non-null";
    } else {
      return "null is required to be non-null";
    }
  }
}
