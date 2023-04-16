import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('hasLengthLessThan', () {
    test(
        'raises an exception when an iterable does not have a length less than a value',
        () {
      expect(
        () => require([1]).hasLengthLessThan(1),
        throwsA(isA<IterableLessLengthRequired>()),
      );
    });

    test(
        'does not raise an exception when an iterable has a length less than a value',
        () {
      expect(
        () => require([1]).hasLengthLessThan(2),
        returnsNormally,
      );
    });
  });
}
