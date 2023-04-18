import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('hasLengthGreaterThanOrEqualTo', () {
    test(
        'raises an exception when a string does not have a length greater than a value',
        () {
      expect(
        () => require('naoty', label: 'value').hasLengthGreaterThanOrEqualTo(6),
        throwsA(isA<StringLengthGreaterThanOrEqualToRequired>()),
      );
    });

    test('does not raise an exception when a string has a length', () {
      expect(
        () => require('naoty', label: 'value').hasLengthGreaterThanOrEqualTo(5),
        returnsNormally,
      );
    });

    test(
        'does not raise an exception when a string has a length greater than a value',
        () {
      expect(
        () => require('naoty', label: 'value').hasLengthGreaterThanOrEqualTo(4),
        returnsNormally,
      );
    });
  });
}
