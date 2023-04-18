import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('hasLengthGreaterThan', () {
    test(
        'raises an exception when a string does not have a length greater than a value',
        () {
      expect(
        () => require('naoty', label: 'value').hasLengthGreaterThan(5),
        throwsA(isA<StringLengthGreaterThanRequired>()),
      );
    });

    test(
        'does not raise an exception when a string has a length greater than a value',
        () {
      expect(
        () => require('naoty', label: 'value').hasLengthGreaterThan(4),
        returnsNormally,
      );
    });
  });
}
