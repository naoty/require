import 'package:require/require.dart';
import 'package:test/test.dart';

void main() {
  group('hasLengthLessThan', () {
    test(
        'raises an exception when a string does not have a length less than a value',
        () {
      expect(
        () => require('naoty').hasLengthLessThan(5),
        throwsA(isA<StringLengthLessThanRequired>()),
      );
    });

    test(
        'does not raise an exception when a string has a length less than a value',
        () {
      expect(
        () => require('naoty').hasLengthLessThan(6),
        returnsNormally,
      );
    });
  });
}
