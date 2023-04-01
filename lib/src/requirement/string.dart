import 'package:require/src/subject.dart';

extension StringRequirement on Subject<String> {
  Subject<String> isEmpty() {
    if (value.isNotEmpty) {
      throw EmptyStringRequired(value: value);
    }

    return this;
  }

  Subject<String> isNotEmpty() {
    if (value.isEmpty) {
      throw NotEmptyStringRequired(value: value);
    }

    return this;
  }
}

class EmptyStringRequired implements Exception {
  final String _value;

  EmptyStringRequired({required String value}) : _value = value;

  @override
  String toString() => "'$_value' is required to be empty";
}

class NotEmptyStringRequired implements Exception {
  final String _value;

  NotEmptyStringRequired({required String value}) : _value = value;

  @override
  String toString() => "'$_value' is required not to be empty";
}
