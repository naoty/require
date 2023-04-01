import 'package:require/src/subject.dart';

Subject<T> require<T>(T value, {String? label}) {
  return Subject(value: value, label: label);
}
