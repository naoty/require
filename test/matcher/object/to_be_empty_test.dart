import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  test('toBeEmpty raises an exception when the string is not empty', () {
    expect(() => require('naoty', toBeEmpty),
        throwsA(isA<EmptyStringException>()));
  });

  test('toBeEmpty does not raise an exception when the string is empty', () {
    expect(() => require('', toBeEmpty), returnsNormally);
  });

  test('toBeEmpty raises an exception when the iterable is not empty', () {
    expect(() => require([1, 2, 3], toBeEmpty),
        throwsA(isA<EmptyIterableException>()));
  });

  test('toBeEmpty does not raise an exception when the iterable is empty', () {
    expect(() => require([], toBeEmpty), returnsNormally);
  });
}
