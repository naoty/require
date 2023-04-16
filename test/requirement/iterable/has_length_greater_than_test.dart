import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('hasLengthGreaterThan', () {
    test(
        'raises an exception when an iterable does not have a length greater than a value',
        () {
      expect(
        () => require([1]).hasLengthGreaterThan(1),
        throwsA(isA<IterableGreaterLengthRequired>()),
      );
    });

    test(
        'does not raise an exception when an iterable has a length greater than a value',
        () {
      expect(
        () => require([1]).hasLengthGreaterThan(0),
        returnsNormally,
      );
    });
  });
}
