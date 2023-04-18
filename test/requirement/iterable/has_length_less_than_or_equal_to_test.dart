import 'package:test/test.dart';
import 'package:require/require.dart';

void main() {
  group('hasLengthLessThanOrEqualTo', () {
    test(
        'raises an exception when an iterable does not have a length less than or equal to a value',
        () {
      expect(
        () => require([1], label: 'value').hasLengthLessThanOrEqualTo(0),
        throwsA(isA<IterableLessOrEqualLengthRequired>()),
      );
    });

    test(
        'does not raise an exception when an iterable has a length less than or equal to a value',
        () {
      expect(
        () => require([1], label: 'value').hasLengthLessThanOrEqualTo(1),
        returnsNormally,
      );
    });
  });
}
