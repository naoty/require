import 'package:require/src/subject.dart';

Subject<T> require<T>(T value) {
  return Subject(value: value);
}
