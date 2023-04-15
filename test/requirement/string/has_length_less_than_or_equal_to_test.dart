import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('hasLengthLessThanOrEqualTo', () {
    test(
        'raises an exception when a string does not have a length less than a value',
        () {
      expect(
        () => require('naoty').hasLengthLessThanOrEqualTo(4),
        throwsA(isA<StringLengthLessThanOrEqualToRequired>()),
      );
    });

    test('does not raise an exception when a string has a length', () {
      expect(
        () => require('naoty').hasLengthLessThanOrEqualTo(5),
        returnsNormally,
      );
    });

    test(
        'does not raise an exception when a string has a length less than a value',
        () {
      expect(
        () => require('naoty').hasLengthLessThanOrEqualTo(6),
        returnsNormally,
      );
    });
  });
}
