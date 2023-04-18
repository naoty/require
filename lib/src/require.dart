import 'package:require/src/subject.dart';

Subject<T> require<T>(T value, {required String label}) {
  return Subject(value: value, label: label);
}

Subject<T>? requireIfNotNull<T>(T? value, {required String label}) {
  if (value == null) {
    return null;
  }
  return Subject(value: value, label: label);
}
