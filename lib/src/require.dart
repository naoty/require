import 'package:require/require.dart';

void require<T>(T value, Matcher<T> matcher) {
  final exception = matcher.match(value);
  if (exception != null) {
    throw exception;
  }
}
